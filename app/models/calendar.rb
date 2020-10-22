class Calendar < ApplicationRecord
  belongs_to :user

  validates :weight, :start_time, presence: true
end
