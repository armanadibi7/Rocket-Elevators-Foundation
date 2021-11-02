class Battery < ApplicationRecord
    has_many :columns, dependent: :delete_all
end
