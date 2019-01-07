class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  scope :ordered_by_date, ->{order created_at: :desc}

  validates :text,  presence: true, length: { maximum: 100, minimum: 3 }
end
