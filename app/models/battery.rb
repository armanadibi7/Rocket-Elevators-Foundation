class Battery < ApplicationRecord
    has_many :elevators, dependent: :delete_all
end
