# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  subject    :string
#  start_date :date
#  end_date   :date
#  location   :string
#  price      :decimal(, )
#

class Course < ActiveRecord::Base
	has_many :submissions
	has_many :students, through: :submissions
end
