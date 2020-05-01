class Organization < ActiveRecord::Base
  has_many :employees
  validates_presence_of :name, :email, :password_digest
  has_secure_password
end
