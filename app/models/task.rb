class Task < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { maximum: 999 }
  validates :tasktime, presence: true, numericality: { only_integer: true }, length: { maximum: 3 }
end
