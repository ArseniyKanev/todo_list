class List < ActiveRecord::Base
	validates :title, :description, presence: true
	belongs_to :user
	has_many :items
end
