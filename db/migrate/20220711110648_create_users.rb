class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :first_name, null: true
      t.string :last_name, null: true
      t.string :location, null: true
      t.date :dob, null: true
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
