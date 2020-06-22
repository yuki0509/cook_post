class Cook < ApplicationRecord
    has_one_attached :image
    validates :name, presence: true
    validates :user_id, presence: true
    
    def self.csv_attributes
        ["name","how_to","created_at","updated_at"]
    end

    def self.generate_csv
        CSV.generate(headers: true) do |csv|
            csv << csv_attributes
            all.each do |cook|
                csv << csv_attributes.map{|attr| cook.send(attr)}
            end
        end
    end
    
    belongs_to :user
end
