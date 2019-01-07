class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title,  presence: true, length: { maximum: 30, minimum: 5 }
  validates :body, presence: true, length: { maximum: 200, minimum: 10 }

  scope :ordered_by_date, ->{order created_at: :desc}
  scope :user_id_in, ->(following_ids, id){where(
    "user_id IN (:following_ids) OR user_id = :user_id",
    following_ids: following_ids, user_id: id)}
end
