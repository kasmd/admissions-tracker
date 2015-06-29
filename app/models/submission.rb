# == Schema Information
#
# Table name: submissions
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  course_id     :integer
#  status        :string
#  instructor_id :integer
#  officer_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Submission < ActiveRecord::Base
	belongs_to :student
	belongs_to :instructor
	belongs_to :officer
	belongs_to :course
	has_one :phonescreen
	has_one :interview

	validates :application_file_name, presence: true

	def save_attachment(attachment)
		s3 = Aws::S3::Client.new
    user_name = self.student.l_name + "-" + self.student.f_name + "_"

    file_key = user_name + self.course_id.to_s + "_application" + File.extname(attachment.original_filename)

    self.application_file_name = file_key
    File.open(attachment.tempfile, 'rb') do|file|
	  	s3.put_object(bucket: 'admitron5000', key: file_key, body: file)
  	end
    
	end
	
	def phone_change_status
		scores = self.phonescreen
		total = scores.q1.to_i + scores.q2.to_i + scores.q2.to_i + scores.q3.to_i + scores.q4.to_i + scores.q5.to_i
		if total > 13
			self.status = "pending-in-person"
		else
			self.status = "rejected"
		end
		self.save
	end

	def interview_change_status
		scores = self.interview
		total = scores.q1.to_i + scores.q2.to_i + scores.q2.to_i + scores.q3.to_i + scores.q4.to_i + scores.q5.to_i
		if total > 13
			self.status = "accepted"
		else
			self.status = "rejected"
		end
		self.save
	end

	def has_attachment
		!self.application_file_name.nil?
	end

	def render_attachment
		if self.application_file_name
			s3 = Aws::S3::Client.new
			file_key = self.application_file_name
			f = s3.get_object(bucket: 'admitron5000', key: file_key).body
			f.read
		end
	end

end
