class DropTables < ActiveRecord::Migration
  def change
  	drop_table :answers
  	drop_table :answers_surveys
  	drop_table :questions
  	drop_table :surveys
  end
end
