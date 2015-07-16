class Pdf < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :user_pdf, presence: true

  mount_uploader :user_pdf, UserPdfUploader
end
