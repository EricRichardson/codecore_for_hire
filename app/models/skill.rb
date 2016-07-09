class Skill < ActiveRecord::Base
  belongs_to :profile

  validates :name, presence: true
  validates :rating, presence: true
end
