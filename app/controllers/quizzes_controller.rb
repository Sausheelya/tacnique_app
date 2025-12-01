class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def take
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions.order(:id)
  end

  def submit
    @quiz = Quiz.find(params[:id])
    answers = params[:answers] || {}
    score   = 0

    @quiz.questions.each do |q|
      user_answer = answers[q.id.to_s].to_s.strip
      correct = check_answer(q, user_answer)
      score  += 1 if correct

      Response.create!(
        quiz: @quiz,
        question: q,
        user_answer: user_answer,
        is_correct: correct
      )
    end

    session[:quiz_result] = { quiz_id: @quiz.id, score: score, total: @quiz.questions.count }
    redirect_to results_quiz_path(@quiz)
  end

  def results
  data = session[:quiz_result]
  Rails.logger.info "RESULTS ACTION data=#{data.inspect}, params_id=#{params[:id]}"

  @quiz  = Quiz.find(params[:id])

  # use string keys because session stored them as strings
  @score = data["score"] || 0
  @total = data["total"] || @quiz.questions.count

  @percent = ((@score.to_f / @total) * 100).round(1)

  render :results
end


  private

  def check_answer(question, user_answer)
    return false if user_answer.blank?

    case question.question_type
    when 'mcq'
      # options stored as JSON string; correct_answer is a single option text
      user_answer.strip == question.correct_answer.to_s.strip
    when 'true_false'
      # normalize to boolean
      ua = %w[true 1 yes].include?(user_answer.downcase)
      ca = %w[true 1 yes].include?(question.correct_answer.to_s.downcase)
      ua == ca
    when 'text'
      user_answer.downcase.strip == question.correct_answer.to_s.downcase.strip
    else
      false
    end
  end
end