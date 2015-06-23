class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.references :submission
    	t.references :question
    	t.text :body
    	t.timestamps
    end
  end
end
