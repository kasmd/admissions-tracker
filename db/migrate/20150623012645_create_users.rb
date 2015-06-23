class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :type
    	t.string :f_name, null: false
    	t.string :l_name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.string :phone_number
    	t.timestamps
    end
  end
end
