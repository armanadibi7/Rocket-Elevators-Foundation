class Battery < ApplicationRecord
    belongs_to :building
    #belongs_to :admin, optional: true
    has_many :columns
end
