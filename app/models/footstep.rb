class Footstep < ApplicationRecord
  belongs_to :user
  has_many :favos, dependent: :destroy
  validates :footstep, presence: true
  validates :date, presence: true
end
