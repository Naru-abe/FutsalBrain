class Video < ApplicationRecord
  has_one_attached :video
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  def get_video
    unless video.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      video.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    video
  end
end
