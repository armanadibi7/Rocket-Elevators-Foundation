class Building < ApplicationRecord
    belongs_to :address, dependent: :destroy
    belongs_to :customer, dependent: :destroy 
end
