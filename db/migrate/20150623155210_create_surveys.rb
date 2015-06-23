class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
    	t.string :type
    end
  end
end
