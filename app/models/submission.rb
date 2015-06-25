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

	def save_attachment(attachment)
    user_name = self.student.l_name + "-" + self.student.f_name
    file_name = Rails.root.join('public', 'uploads', 'applications', ("#{self.course_id}_" + user_name + '.txt'))

    @application_file_name = file_name
    File.open(file_name, 'wt') do |file|
      file.write(attachment.read)
    end

	end

end
