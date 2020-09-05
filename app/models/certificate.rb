class Certificate < ApplicationRecord
    validates :my_name, presence: true, length: { maximum: 20 }
    validates :your_name, presence: true, length: { maximum: 20 }
    validates :content, presence: true, length: { in: 17..135 }
    validates :style, presence: true
end
