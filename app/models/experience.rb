class Experience < ActiveRecord::Base
  belongs_to :profile

  validates :company, presence: true
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :start, presence: true
  validates :end, presence: true

end
