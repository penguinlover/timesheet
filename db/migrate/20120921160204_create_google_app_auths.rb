class CreateGoogleAppAuths < ActiveRecord::Migration
  def change
    create_table :google_app_auths do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
