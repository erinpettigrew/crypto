class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :set_question

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = @question.id
    @answer.save
    render json: { answer: render_to_string('answers/answer', layout: false, locals: { answer: @answer }) }
  end

  def edit
  end

  def update
    @answer = Answer.update(answer_params)
  end

  def destroy
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.friendly.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :user_id)
  end
end
