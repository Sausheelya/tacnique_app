class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :responses, through: :questions

  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :title, presence: true, length: { minimum: 3 }

  def self.ransackable_attributes(auth_object = nil)
    %w[id title created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[questions responses]
  end
end
