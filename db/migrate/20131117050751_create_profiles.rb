class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description, :limit => 1024

      t.timestamps
    end
  end
end
