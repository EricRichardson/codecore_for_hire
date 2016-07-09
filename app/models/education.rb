class Education < ActiveRecord::Base
  belongs_to :profile

  validates :school, presence: true
  validates :major, presence: true

end
