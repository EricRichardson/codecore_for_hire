class User < ActiveRecord::Base
  attr_accessor :image_cache

  has_secure_password
  has_one :profile

  EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: EMAIL_REGEX

  mount_uploader :image, ImageUploader

  def full_name
    "#{first_name} #{last_name}"
  end

  def default_image
      @image = '/images/default-cat.jpg'
  end

end
