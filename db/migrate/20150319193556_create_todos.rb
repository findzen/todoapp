class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :text
      t.boolean :done, default: false
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
