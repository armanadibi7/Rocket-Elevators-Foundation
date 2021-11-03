class Building < ApplicationRecord
    belongs_to :customer
    belongs_to :address
    has_many :building_detail
end
