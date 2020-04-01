class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :first_name
      t.string :email, null: false, default:""
      t.string :phone, null: false, default:""
      t.text :comment, null: true
      t.timestamps
    end
  end
end
