class ResponsesController < ApplicationController
 
 
 
 
 
   def create
  @survey = Survey.find(params[:survey_id])
  @response = @survey.responses.new(response_params)
   
    
  
  if @response.save
    render json: @survey, status: :created, location: @survey  
  else
   render json: @survey.errors, status: :unprocessable_entity   
  end
  
  end
  
  
  
  
  
  
  
  
  
  
  
  private
  
  def response_params
        params.require(:response).permit(participates_attributes: [:poll_id, :option_id])  
    end
  
  
  
  
  
  
end
