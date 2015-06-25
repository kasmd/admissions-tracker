class AddColumnSubmissions < ActiveRecord::Migration
  def change
  	add_column :submissions, :phonescreen_id, :integer
  end
end
