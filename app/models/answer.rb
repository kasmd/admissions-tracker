class Answer < ActiveRecord::Base
	has_and_belongs_to_many :surveys
	belongs_to :submission
end