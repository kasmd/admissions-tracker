# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  type            :string
#  f_name          :string           not null
#  l_name          :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  phone_number    :string
#  created_at      :datetime
#  updated_at      :datetime
#

class Student < User
	has_many :submissions
	has_many :courses, through: :submissions

	def has_already_submitted?(course_id)
		submissions = self.submissions.map do|sub|
			sub.course_id
		end
		submissions.include?(course_id.to_i)
	end

	def submission_for(course_id)
		submission = self.submissions.where(course_id: course_id).first
		submission.id
	end

end
