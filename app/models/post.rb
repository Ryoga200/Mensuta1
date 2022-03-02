class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    validates :name, presence: true
    validates :food, presence: true
    validates :shop, presence: true

end