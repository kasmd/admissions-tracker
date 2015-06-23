class CreateSurveysAnswers < ActiveRecord::Migration
  def change
    create_table :surveys_answers do |t|
    	t.references :survey
    	t.references :answer
    end
  end
end
