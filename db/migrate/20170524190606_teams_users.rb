class TeamsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_users, :id => false do |t|
      t.references :team
      t.references :user
    end
  end
end
