class Customer < ApplicationRecord
    belongs_to :address, dependent: :destroy
    has_one :building
end
