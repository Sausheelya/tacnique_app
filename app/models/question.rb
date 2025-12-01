class Question < ApplicationRecord
  belongs_to :quiz
  has_many :responses, dependent: :destroy
  validates :content, :question_type, :correct_answer, presence: true
  validates :question_type, inclusion: {in: %w[mcq true_false text]}
  has_many :questions, class_name: 'Admin::Question'


   def self.ransackable_attributes(auth_object = nil)
    %w[id content question_type correct_answer quiz_id created_at updated_at quiz responses]
  end 
end
