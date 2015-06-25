class AddDefaultValueToSubmissionStatus < ActiveRecord::Migration
  
  def up
  	change_column :submissions, :status, :string, :default => "pending-phone"
  end

	def down
  	change_column :submissions, :status, :string, :default => "pending-phone"
	end
end
