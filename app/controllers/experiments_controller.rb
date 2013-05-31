# -*- encoding : utf-8 -*-
class ExperimentsController < ApplicationController
  before_filter :check_auth

  def index
    @experiments = (current_user.moderator?) ? (Experiment.order(:name).all) :
        (Experiment.where("status=3 OR owner_id = ? OR confirmatory_id = ?",current_user.id,current_user.id))
  end

  def show
    @experiment = Experiment.find(params[:id])
    Dir.chdir("public") do
      @pdfs = Dir.glob("system/pdfs/#{params[:id]}/*.pdf")
    end
  end

  # GET /experiments/new
  # GET /experiments/new.json
  def new
    @experiment = Experiment.new(:node_id=>params[:node_id])
    source = @experiment.sources.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment }
    end
  end

  # GET /experiments/1/edit
  def edit
    @experiment = Experiment.find(params[:id])
  end

  # POST /experiments
  # POST /experiments.json
  def create
    @experiment = Experiment.new(params[:experiment])
    @experiment.owner_id = current_user.id
    @experiment.status = 0

    #params[:fimages].each do |image|
    #img = @experiment.images.build(image)
    #img.save
    #end

    respond_to do |format|
      if @experiment.save
        format.html { redirect_to @experiment}
        format.json { render json: @experiment, status: :created, location: @experiment }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /experiments/1
  # PUT /experiments/1.json
  def update

    @experiment = Experiment.find(params[:id])
    @experiment.status = 0

    #raise (params[:fimages].inspect)

    params[:experiment][:images_attributes].each do |image|
      #raise image[:img].inspect
      img = @experiment.images.build({:img => image[:img]})

    #  puts "\33[41m"
    #  puts "\n"*5
    #  p img
    #  puts "\n"*5
    #  puts "\033[0m"
      img.save
    end

    respond_to do |format|
      if @experiment.update_attributes(params[:experiment])
        format.html { redirect_to @experiment,notice: params.inspect}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiments/1
  # DELETE /experiments/1.json
  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy

    respond_to do |format|
      format.html { redirect_to experiments_url }
      format.json { head :no_content }
    end
  end

  def checklist
    @experiments = Experiment.where("status=1")
  end

  def check
    @experiment = Experiment.find(params[:id])
    @experiment.status = 1
    respond_to do |format|
      if @experiment.save
        format.html { redirect_to @experiment, notice: 'Эксперимент отправлен на проверку.' }
        format.json { render json: @experiment, status: :created, location: @experiment }
      else
        format.html { redirect_to @experiment, notice: 'Эксперимент не отправлен на проверку.' }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    @experiment = Experiment.find(params[:id])
    @experiment.status=3
    @experiment.confirmatory_id = current_user.id
    respond_to do |format|
      if @experiment.save
        format.html { redirect_to @experiment, notice: 'Эксперимент одобрен.' }
        format.json { render json: @experiment, status: :created, location: @experiment }
      else
        format.html { redirect_to @experiment, notice: 'Эксперимент не одобрен.' }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  def decline
    @experiment = Experiment.find(params[:id])
    @experiment.status=2
    @experiment.confirmatory_id = current_user.id
    respond_to do |format|
      if @experiment.save
        format.html { redirect_to @experiment, notice: 'Эксперимент отклонен.' }
        format.json { render json: @experiment, status: :created, location: @experiment }
      else
        format.html { redirect_to @experiment, notice: 'Эксперимент не отклонен.' }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_cookie
    if cookies[:experiments].blank?
      id_list=[]
    else
      id_list = cookies[:experiments].split(";")
    end
    ind = id_list.index(params[:id])
    msg = "Что-то пошло не так"
    if ind
      id_list.delete(params[:id])
      msg = "Эксперимент удален из списка сравнения"
    else
      if id_list.size < 5
        id_list << params[:id]
        msg = "Эксперимент добавлен в список сравнения!"
      else
        msg = "Эксперимент не добавлен в список сравнения так как количество уже выбранных не может превышать 5!"
      end
    end
    cookies[:experiments] = id_list.join(";")
    redirect_to :back, notice: msg
  end

  def reset_cookie
    cookies.delete :experiments
    redirect_to :back, notice: 'Список сравнения очищен!'
  end

  def compare
    if cookies[:experiments].blank?
      @experiments = []
    else
      list = cookies[:experiments].split(";")
      @experiments = Experiment.where(:id => list).where("owner_id = ? OR confirmatory_id = ?",current_user.id,current_user.id).all
    end
  end

  def set_deleted
    @experiment = Experiment.find(params[:id])
    @experiment.status = @experiment.status % 10 + 10
    @experiment.save
    redirect_to :back, notice: 'Эксперимент помечен как удаленный!'
  end

  def set_undeleted
    @experiment = Experiment.find(params[:id])
    @experiment.status %= 10
    @experiment.save
    redirect_to :back, notice: 'Эксперимент помечен как удаленный!'
  end

  def generate_pdf
    experiment = Experiment.find(params[:id])
    date = l experiment.created_at,format: :long
    require "prawn"

    dir = Dir.chdir("public/system/pdfs") do
      if Dir[params[:id]] == []
        Dir.mkdir(params[:id])
      end
      dir = Dir.chdir(params[:id]) do

        Prawn::Document.generate(experiment.name+".pdf") do
          font = "Verdana"
          font_families.update(
              font => {
                  :bold => "#{Rails.root}/app/assets/fonts/verdanab.ttf",
                  :italic => "#{Rails.root}/app/assets/fonts/verdanai.ttf",
                  :normal  => "#{Rails.root}/app/assets/fonts/verdana.ttf" })
          font font, :size => 12

          text experiment.name, :size => 20,:align => :center
          move_down 20


          text "<b>Эксперимент проведен:</b> #{date} " +
          "пользователем <b>#{experiment.owner.username}</b>",
            :inline_format => true

          experiment.images.each do |img|
            move_down 10
            #image ("#{Rails.root}#{img.img.url}"),:position => :center, :width => 550
          end



        end
      end
    end
    redirect_to experiment, notice: 'Отчет сформирован'
  end

end
