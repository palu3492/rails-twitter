class Tweet < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: {minimum: 1, maximum: 280}
  validates :body, presence: true, length: {minimum: 1, maximum: 280}
end
