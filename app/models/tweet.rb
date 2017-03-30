class Tweet < ActiveRecord::Base
    validates :content, presence: true
    validates :content, length: { minimum: 1 }  # 値が「1文字以上」であれば有効
    validates :content, length: { maximum: 140 }  # 値が「140文字以下」であれば有効
end
