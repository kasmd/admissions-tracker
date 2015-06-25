class AddSubmissionIdInterview < ActiveRecord::Migration
  def change
  	add_column :interviews, :submission_id, :integer
  end
end
