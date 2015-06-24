class ChangeSubmissionsRenameFileName < ActiveRecord::Migration
  def change
  	rename_column :submissions, :file_file_name, :application_file_name
  end
end
