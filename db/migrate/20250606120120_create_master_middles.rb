class CreateMasterMiddles < ActiveRecord::Migration[8.0]
  def change
    create_table :master_middles do |t|
      t.string :name
      t.timestamps
    end
  end
end
