class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :text
      t.boolean :done
      t.boolean :deleted

      t.timestamps null: false
    end
  end
end
