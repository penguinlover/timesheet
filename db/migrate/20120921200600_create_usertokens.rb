class CreateUsertokens < ActiveRecord::Migration
  def change
    create_table :usertokens do |t|
      t.string :security_token
      t.integer :user_id

      t.timestamps
    end
  end
end
