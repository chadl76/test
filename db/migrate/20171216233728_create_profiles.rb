class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :birthday
      t.string :words_to_live_by
      t.string :hometown
      t.string :college
      t.integer :user_id

      t.timestamps
    end
  end
end
