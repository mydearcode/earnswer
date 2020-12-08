class AnswersController < ApplicationController
  before_action :load_question
 # before_filter :ensure_logged_in, only: [:create, :destroy]
    def index
        @answers = @question.answers
        render json: @answers
    end

  def show
    @answer = Answer.find(params[:id])
    render json: @answer
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.body.strip!

    if @answer.body.length > 0
      @answer.user = current_user

      if @answer.save
        render json: @answer, status: :created, location: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    else
      
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    if current_user && current_user == @answer.user
      @answer.destroy
      render json: "Deleted."
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end 
  
  def select_best_answer
       @answer = Answer.find(params[:id])
       @answers = @question.answers
    if @question.user == current_user or current_user.admin?
        if @answer.solved? 
            @answer.update_attribute(:solved, false) 
            @question.update_attribute(:solved, false)
            render json: @answer
        else
        @answers.each do |answer|
            if answer.solved?
                answer.update_attribute(:solved, false)  
                end
            end
            
            @answer.update_attribute(:solved, true)
            @question.update_attribute(:solved, true)
           render json: @answer
        
        end
       
    else
        render json: "Oopps! Only Question owner or moderator can do it"
        
        
    end
  end

private
  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end

  def load_question
    @question = Question.find(params[:question_id])
  end
  
end