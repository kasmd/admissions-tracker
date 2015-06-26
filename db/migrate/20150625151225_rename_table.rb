class RenameTable < ActiveRecord::Migration
  def change
  	rename_table :phones, :phonescreens
  end
end
