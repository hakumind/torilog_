class Post < ApplicationRecord
     # 空白防止
     validates :name, {presence: true}

     mount_uploader :image, ImageUploader

     validates :user_id, {presence: true}

     validates :image, {presence: true}

end
