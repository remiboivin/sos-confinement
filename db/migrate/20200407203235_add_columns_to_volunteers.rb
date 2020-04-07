class AddColumnsToVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :name, :string,default:""
    add_column :volunteers, :first_name, :string,default:""
    add_column :volunteers, :alias, :string,default:""
    add_column :volunteers, :specialty, :string,default:""
    add_column :volunteers, :is_valid, :boolean,default: true
    add_column :volunteers, :comment, :string,default:""
  end
end
