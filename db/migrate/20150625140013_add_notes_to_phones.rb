class AddNotesToPhones < ActiveRecord::Migration
  def change
  	add_column :phones, :notes, :text
  end
end
