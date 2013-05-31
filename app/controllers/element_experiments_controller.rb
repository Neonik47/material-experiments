class ElementExperimentsController < ApplicationController
  # GET /element_experiments
  # GET /element_experiments.json
  def index
    @element_experiments = ElementExperiment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @element_experiments }
    end
  end

  # GET /element_experiments/1
  # GET /element_experiments/1.json
  def show
    @element_experiment = ElementExperiment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @element_experiment }
    end
  end

  # GET /element_experiments/new
  # GET /element_experiments/new.json
  def new
    @element_experiment = ElementExperiment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @element_experiment }
    end
  end

  # GET /element_experiments/1/edit
  def edit
    @element_experiment = ElementExperiment.find(params[:id])
  end

  # POST /element_experiments
  # POST /element_experiments.json
  def create
    @element_experiment = ElementExperiment.new(params[:element_experiment])

    respond_to do |format|
      if @element_experiment.save
        format.html { redirect_to @element_experiment, notice: 'Element experiment was successfully created.' }
        format.json { render json: @element_experiment, status: :created, location: @element_experiment }
      else
        format.html { render action: "new" }
        format.json { render json: @element_experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /element_experiments/1
  # PUT /element_experiments/1.json
  def update
    @element_experiment = ElementExperiment.find(params[:id])

    respond_to do |format|
      if @element_experiment.update_attributes(params[:element_experiment])
        format.html { redirect_to @element_experiment, notice: 'Element experiment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @element_experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /element_experiments/1
  # DELETE /element_experiments/1.json
  def destroy
    @element_experiment = ElementExperiment.find(params[:id])
    @element_experiment.destroy

    respond_to do |format|
      format.html { redirect_to element_experiments_url }
      format.json { head :no_content }
    end
  end
end
