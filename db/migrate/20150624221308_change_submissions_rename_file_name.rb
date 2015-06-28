class AddApplicationFileNameToSubmissions < ActiveRecord::Migration
  def change
  	add_column :submissions, :application_file_name, :string
  end
end
