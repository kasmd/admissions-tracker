class AddSubmissionIdToPhones < ActiveRecord::Migration
  def change
  	remove_column :submissions, :phone_id
  	add_column :phones, :submission_id, :integer
  end
end
