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

class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true, presence: true

	def type_path
		"#{self.type.downcase}s"
	end

end
