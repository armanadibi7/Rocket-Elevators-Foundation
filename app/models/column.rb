class Column < ApplicationRecord
    has_many :elevators, dependent: :delete_all
    belongs_to :battery
end
