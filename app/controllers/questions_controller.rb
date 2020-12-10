class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]
  before_action :set_question_id, only: [:disburse, :finish]

  # GET /questions
  def index
    @questions = Question.all

    render json: @questions
  end


  # GET /questions/1
  def show
    render json: @question
    @answers = @question.answers
    #render json: @answers
    
  end

  # POST /questions
  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end
  
 
   # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DESTROY /questions/1
  def destroy
      if current_user.admin?
        @question.destroy
    else
        render json: "You don't have permission to destroying this question"
    end
  end
  
  
  
  #ADDITIONAL METHODS
  
  # DELETE /questions/1
    def delete
        if current_user.admin? or current_user == @question.user
            @question.update_attribute(:deleted, true)
        else
            render json: "You dont have permission to deleting this question"
        end
    end
 
    def publish
        @question = Question.find(params[:question_id])
        if @question.user.budget > @question.reward
            @question.update_attribute(:passed, true)
            @question.user.increment!(:freezed_budget, @question.reward)
            @question.user.decrement!(:budget, @question.reward)
            render json: "Question is published Successfully", status: :ok
        else
            render json: "Your budget is not enough to question publish", status: :unprocessable_entity
        end
 
 
 
    
   #Approving questions on published(passed) questions page 
    def approve
        if current_user.role == 2 or current_user.admin?
           @question.update_attribute(:approved, true)  
        end
    end
    
    
end



#disburse money to right answered users after finished

def disburse
   if current_user.role == 2 or current_user.admin?
           
          total_good_answers = @question.answers.where(good_answer: true)
          solved_answer = @question.answers.where(solved: true).first
          smallPercent = @question.reward*20/100
          pay = smallPercent / total_good_answers.size
          total_good_answers.each do |answer|
            answer.user.increment!(:budget, pay)
         end
         @question.decrement!(:reward, smallPercent)
         bigPay = @question.reward*70/100
         solved_answer.user.increment!(:budget, bigPay)
         @question.decrement!(:reward, bigPay)
          @question.update_attribute(:disbursed, true)
          render json: @question, status: :ok
          
    end 
    
end

#finish the question manually
def finish
   if current_user.id == @question.user_id or current_user.role == 2 or current_user.admin?
          @question.update_attribute(:finished, true) 
          render json: @question, message: "Question is successfully Created!"
    end 
    
end




  
  
  
  

  private
  
  # Only allow a trusted parameter "white list" through.
    def question_params
        params.require(:question).permit(:title, :description, :user_id, :reward)
      #params.require(:question).permit(:title, :description, :reward, :user_id, :approved, :reviewed, :solved, :finished, :deleted, :references, :disbursed, :passed)
    end
  
  
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

   
  
  def set_question_id
      @question = Question.find(params[:question_id])
  end
  
  
    
    def increment!(attribute, by = 0.0)
        self[attribute] ||= 0
        self[attribute] += by
        self
    end
    
    def decrement!(attribute, by = 0.0)
        self[attribute] ||= 0
        self[attribute] -= by
        self
    end
    
    
end
