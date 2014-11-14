class Employee < ActiveRecord::Base
  validates :name, presence: true
  validates :title, presence: true
end
