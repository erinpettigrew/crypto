class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.create(question_params)
    @question.user = current_user
    @question.save
    redirect_to @question
  end

  def edit
  end

  def update
  end

  def index
    @questions = Question.all.includes(:user)
  end

  def destroy
  end

  private
  def set_question
  end

  def question_params
    params.require(:question).permit(:content, :user_id)
  end
end
