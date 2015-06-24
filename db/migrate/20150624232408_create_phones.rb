class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
    	t.string :q1
    	t.string :q2
    	t.string :q3
    	t.string :q4
    	t.string :q5
    	t.timestamps
    end
  end
end
