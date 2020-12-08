class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.all

    render json: @questions
  end
  
  def solved_questions
      @questions = Question.where(solved: true)
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
        @question.user.increment!(:freezed_budget, @question.reward)
      @question.user.decrement!(:budget, @question.reward)
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
        render json: "You dont have permission to destroying this question"
    end
  end
  # DELETE /questions/1
   def delete
        if current_user.admin? or current_user == @question.user
        @question.update_attribute(:deleted, true)
    else
        render json: "You dont have permission to deleting this question"
    end
  end
  
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:title, :description, :reward, :approved, :reviewed, :solved, :finished, :deleted, :references)
    end
    
    def increment!(attribute, by = 1.0)
        self[attribute] ||= 0
        self[attribute] += by
        self
    end
    
    def decrement!(attribute, by = 1.0)
        self[attribute] ||= 0
        self[attribute] -= by
        self
    end
    
    
end
