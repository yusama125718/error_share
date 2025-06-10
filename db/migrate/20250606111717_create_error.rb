class CreateError < ActiveRecord::Migration[8.0]
  def change
    create_table :error_contents do |t|
      t.integer :middle_id
      t.integer :version_id
      t.string :title
      t.text :content
      t.boolean :resolved
      t.timestamps
    end
  end
end
