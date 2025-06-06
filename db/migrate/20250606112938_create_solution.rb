class CreateSolution < ActiveRecord::Migration[8.0]
  def change
    create_table :solutions do |t|
      t.integer :error_id
      t.integer :order
      t.string :content
      t.timestamps
    end
  end
end
