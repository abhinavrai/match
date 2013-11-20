class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :role, :limit => 5
      t.references :user

      t.timestamps
    end
    add_index :groups, :user_id
  end
end
