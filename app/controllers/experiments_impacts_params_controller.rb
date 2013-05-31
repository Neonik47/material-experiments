class ExperimentsImpactsParamsController < ApplicationController
  before_filter :check_auth
  # GET /experiments_impacts_params/new
  # GET /experiments_impacts_params/new.json
  def new
    @experiments_impacts_param = ExperimentsImpactsParam.new(:experiment_id => params[:experiment_id], :impacts_param_id => params[:impacts_param_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiments_impacts_param }
    end
  end

  # GET /experiments_impacts_params/1/edit
  def edit
    @experiments_impacts_param = ExperimentsImpactsParam.find(params[:id])
  end

  # POST /experiments_impacts_params
  # POST /experiments_impacts_params.json
  def create
    @experiments_impacts_param = ExperimentsImpactsParam.new(params[:experiments_impacts_param])
    experiment = @experiments_impacts_param.experiment
    experiment.status = 0
    experiment.save
    respond_to do |format|
      if @experiments_impacts_param.save
        format.html { redirect_to @experiments_impacts_param.experiment }
        format.json { render json: @experiments_impacts_param, status: :created, location: @experiments_impacts_param }
      else
        format.html { render action: "new" }
        format.json { render json: @experiments_impacts_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiments_impacts_params/1
  # PUT /experiments_impacts_params/1.json
  def update
    @experiments_impacts_param = ExperimentsImpactsParam.find(params[:id])
    experiment = @experiments_impacts_param.experiment
    experiment.status = 0
    experiment.save
    respond_to do |format|
      if @experiments_impacts_param.update_attributes(params[:experiments_impacts_param])
        format.html { redirect_to @experiments_impacts_param.experiment}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiments_impacts_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiments_impacts_params/1
  # DELETE /experiments_impacts_params/1.json
  def destroy
    @experiments_impacts_param = ExperimentsImpactsParam.find(params[:id])
    experiment = @experiments_impacts_param.experiment
    experiment.status = 0
    experiment.save
    @experiments_impacts_param.destroy

    respond_to do |format|
      format.html { redirect_to experiment }
      format.json { head :no_content }
    end
  end
end
