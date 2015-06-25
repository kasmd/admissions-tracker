class ChangeQuestionTypeInterviews < ActiveRecord::Migration
  def change
  	change_column :interviews, :q1, 'integer USING CAST(q1 AS integer)'
  	change_column :interviews, :q2, 'integer USING CAST(q2 AS integer)'
  	change_column :interviews, :q3, 'integer USING CAST(q3 AS integer)'
  	change_column :interviews, :q4, 'integer USING CAST(q4 AS integer)'
  	change_column :interviews, :q5, 'integer USING CAST(q5 AS integer)'
  end
end