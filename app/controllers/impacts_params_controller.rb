class ImpactsParamsController < ApplicationController
  before_filter :check_auth
  # GET /impacts_params/new
  # GET /impacts_params/new.json
  def new
    @impacts_param = ImpactsParam.new(:impact_id => params[:impact_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @impacts_param }
    end
  end

  # GET /impacts_params/1/edit
  def edit
    @impacts_param = ImpactsParam.find(params[:id])
  end

  # POST /impacts_params
  # POST /impacts_params.json
  def create
    @impacts_param = ImpactsParam.new(params[:impacts_param])

    respond_to do |format|
      if @impacts_param.save
        format.html { redirect_to @impacts_param.impact}
        format.json { render json: @impacts_param.impact, status: :created, location: @impacts_param }
      else
        format.html { render action: "new" }
        format.json { render json: @impacts_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /impacts_params/1
  # PUT /impacts_params/1.json
  def update
    @impacts_param = ImpactsParam.find(params[:id])

    respond_to do |format|
      if @impacts_param.update_attributes(params[:impacts_param])
        format.html { redirect_to @impacts_param.impact}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @impacts_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impacts_params/1
  # DELETE /impacts_params/1.json
  def destroy
    @impacts_param = ImpactsParam.find(params[:id])
    impact = @impacts_param.impact
    @impacts_param.destroy

    respond_to do |format|
      format.html { redirect_to impact }
      format.json { head :no_content }
    end
  end
end
