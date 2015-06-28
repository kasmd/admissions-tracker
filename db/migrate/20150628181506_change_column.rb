class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :interviews, :q1, :string
  	change_column :interviews, :q2, :string
  	change_column :interviews, :q3, :string
  	change_column :interviews, :q4, :string
  	change_column :interviews, :q5, :string
  end
end
