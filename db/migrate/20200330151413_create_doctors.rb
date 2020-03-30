class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :first_name
      t.string :adeli, null: false
      t.string :login
      t.string :password
      t.string :email, null: false, default:""
      t.string :speciality, null: true
      t.boolean :is_valid
      t.timestamps
    end
  end
end
