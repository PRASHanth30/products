class Prodct < ActiveRecord::Base
validates :name, presence: true, length: { minimum: 3 }
validates :description, presence: true
validates :price, numericality: true
validates :imgurl, format: { with: /jpg\Z/}
end
