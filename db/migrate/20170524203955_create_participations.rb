class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.date :date
      t.float :duration_minutes
      t.references :user, foreign_key: true, null: false
      t.references :sport, foreign_key: true, null: false

      t.timestamps
    end
  end
end
