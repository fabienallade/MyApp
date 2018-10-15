class Todo<ApplicationRecord
validates :name,presence: true
validates :description,presence

  belongs_to :user
end