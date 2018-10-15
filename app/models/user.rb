class User <ApplicationRecord
  before_save {self.email=email.downcase }
  validates :name ,presence: true,length: {minimum: 3,maximum: 100 }
  validates :email ,presence: true,length: {minimum: 3,maximum: 30 },uniqueness: { case_sensitive: false}
  validates :password,presence: true,length: {minimum: 5,maximum: 100},confirmation: true
  validates :password_confirmation,presence: true
  validates_confirmation_of :password

  has_many :todos
  has_many :publications
  has_many :comments,dependent: :destroy
  has_secure_password
end