class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
    	t.references :student
    	t.references :course
    	t.references :status
    	t.integer :instructor_id
    	t.integer :officer_id
    	t.timestamps
    end
  end
end
