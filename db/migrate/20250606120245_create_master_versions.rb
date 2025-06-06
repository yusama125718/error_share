class CreateMasterVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :master_versions do |t|
      t.integer :middle_id
      t.string :name
      t.timestamps
    end
  end
end
