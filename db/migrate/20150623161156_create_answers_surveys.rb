class CreateAnswersSurveys < ActiveRecord::Migration
  def change
    create_table :answers_surveys do |t|
    	t.references :survey
    	t.references :answer
    end
  end
end
