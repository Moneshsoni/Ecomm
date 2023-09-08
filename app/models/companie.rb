class Companie < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :catogery, presence: true, uniqueness: true
	validates :city, presence: true
	validates :country, presence: true
	validates :owner, presence: true, uniqueness: true
end
