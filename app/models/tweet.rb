class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :body, presence: true, length: {minimum: 1, maximum: 280}
end
