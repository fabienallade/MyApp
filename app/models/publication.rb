class Publication <ApplicationRecord
  validates :name ,presence: true
  validates :description ,presence: true,length: {minimum: 3,maximum: 900 }
belongs_to  :user
  has_many :comments,dependent: :destroy
  default_scope ->{order(updated_at: :desc)}
end