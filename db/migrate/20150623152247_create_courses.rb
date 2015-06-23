class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :type
    	t.date :start_date
    	t.date :end_date
    	t.string :location
    	t.currency :price
    end
  end
end
