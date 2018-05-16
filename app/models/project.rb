class Project < ApplicationRecord
  validates_presence_of :title, :description
  has_many :tasks, dependent: :destroy
end
