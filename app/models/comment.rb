class Comment<ApplicationRecord
  validates :body ,presence: true ,length: {minimum: 1,maximum: 5000}
  belongs_to :user
  belongs_to :publication
  validates :chef_id,presence: true
  validates :publication_id ,presence: true
  default_scope ->{order(updated_at: :desc)}
end