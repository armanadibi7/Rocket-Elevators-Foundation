class Customer < ApplicationRecord
    belongs_to :address, dependent: :destroy
end
