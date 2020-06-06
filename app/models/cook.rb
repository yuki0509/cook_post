class Cook < ApplicationRecord
    has_one_attached :image
    validates :name, presence: true
    validates :user_id, presence: true
    
    

    belongs_to :user
end
