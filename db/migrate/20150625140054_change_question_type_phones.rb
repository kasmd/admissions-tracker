class ChangeQuestionTypePhones < ActiveRecord::Migration
  def change
  	change_column :phones, :q1, 'integer USING CAST(q1 AS integer)'
  	change_column :phones, :q2, 'integer USING CAST(q2 AS integer)'
  	change_column :phones, :q3, 'integer USING CAST(q3 AS integer)'
  	change_column :phones, :q4, 'integer USING CAST(q4 AS integer)'
  	change_column :phones, :q5, 'integer USING CAST(q5 AS integer)'
  end  
end