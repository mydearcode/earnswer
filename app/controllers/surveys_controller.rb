class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update, :destroy]
  

  # GET /surveys
  def index
    @surveys = Survey.all
    render json: @surveys
  end

  # GET /surveys/1
  def show
     #render json: @survey, include: [polls: {only: [:id, :title, include: [options: {only: [:id, :title]}]]}]
     #render json: @survey.as_json( include: { polls: { only: [:title], {include: :options}}}), status: :ok
        render json: @survey, only:[:id, :title], include: { polls: { only: [:id, :title], include: { options: { only: [:id, :title] } }}}
  end

  # POST /surveys
  def create
    @survey = current_user.surveys.new(survey_params)

    if @survey.save
      render json: @survey, status: :created, location: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update(survey_params)
      render json: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
  end
  
  # added methods--------------------------------------
  
  def create_response

  @survey = Survey.find(params[:survey_id])
    if @survey.responses.exists?(user: current_user)
        render json: "You have already participated this Survey", status: :unprocessable_entity
    else
        @response = @survey.responses.new(response_params)
        @response.user = current_user
  
        if @response.save
         render json: @survey, status: :created, location: @survey  
        else
        render json: @survey.errors, status: :unprocessable_entity   
        end
    end
  
  end
  
  
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
      params.require(:survey).permit(:title, :description, :user_id, :reward)
    end
    
    
    def response_params
        params.permit(:survey_id, :user_id, participates_attributes: [:poll_id, :option_id])  
    end
    
  
  
  

  
  
  
    
    
end
