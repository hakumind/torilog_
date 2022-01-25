class User < ApplicationRecord

    # 空白防止
    validates :name, {presence: true}
    # 空白防止、重複の防止
    validates :email, {presence: true, uniqueness: true}
    #パスワード未入力防止
    validates :password, {presence: true}
    
end
