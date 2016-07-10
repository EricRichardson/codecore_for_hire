class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :experiences, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :skills, dependent: :destroy
  mount_uploader :resume, ResumeUploader

end
