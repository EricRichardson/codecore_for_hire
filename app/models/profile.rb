class Profile < ActiveRecord::Base
  belongs_to :user
  
  mount_uploader :resume, ResumeUploader

end
