class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
        t.references :student
        t.references :course
        t.string :status
        t.integer :instructor_id
        t.integer :officer_id
        t.integer :phone_id
        t.integer :interview_id
        t.string  :application_file_name
        t.timestamps
    end
  end
end
