class Tax < ApplicationRecord
    validates :name, presence: true
    validates :value, presence: true 
    validates :value, numericality: true
end
