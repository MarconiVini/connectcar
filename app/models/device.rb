class Device < ActiveRecord::Base
  belongs_to :user
  validates :tag, uniqueness: true
end
