class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.float :height_inches
      t.float :weight_pounds
      t.boolean :private_profile

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
