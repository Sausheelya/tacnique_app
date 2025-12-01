class Response < ApplicationRecord
  belongs_to :quiz
  belongs_to :question
  validates :user_answer, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id user_answer is_correct quiz_id question_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[quiz question]
  end
end