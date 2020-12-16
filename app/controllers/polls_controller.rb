class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update, :destroy]
  before_action :set_survey, only: [:show, :update, :destroy, :create, :edit, :index]

  # GET /polls
  def index
    @polls = Poll.all

    render json: @polls
  end

  # GET /polls/1
  def show
    render json: @poll
  end

  # POST /polls
  def create
       @survey = Survey.find(params[:survey_id])
    @poll = @survey.polls.new(poll_params)
   

    if @poll.save
      render json: @survey, include: [polls: {only: [:id, :title, include: [options: {only: [:id, :title]}]]}], status: :created, location: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /polls/1
  def update
    if @poll.update(poll_params)
      render json: @poll
    else
      render json: @poll.errors, status: :unprocessable_entity
    end
  end

  # DELETE /polls/1
  def destroy
    @poll.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    
    def poll_params
      params.require(:poll).permit(:title, :questionType, :survey_id, :user_id, options_attributes:[:title, :poll_id])
    end
    def set_survey
      @survey = Survey.find(params[:survey_id])
    end
end
