class CreateSportsInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :sports_interests do |t|
      t.references :user, foreign_key: true, null: false
      t.references :sport, foreign_key: true, null: false

      t.timestamps
    end
  end
end
