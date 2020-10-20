class Calendar < ApplicationRecord
  belongs_to :user

  validates :title, :start_time, presence: true
end
