class AddDefaultForSubmissionsStatus < ActiveRecord::Migration
  def change
  	change_column :submissions, :status, :string, default: "pending-phone"
  end
end
