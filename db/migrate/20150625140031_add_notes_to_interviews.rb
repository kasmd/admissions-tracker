class AddNotesToInterviews < ActiveRecord::Migration
  def change
  	add_column :interviews, :notes, :text
  end
end
