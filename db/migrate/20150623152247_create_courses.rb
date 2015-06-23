class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :subject
    	t.date :start_date
    	t.date :end_date
    	t.string :location
    	t.decimal :price
    end
  end
end
