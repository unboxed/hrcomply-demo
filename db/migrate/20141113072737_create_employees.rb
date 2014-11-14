class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :notes

      t.timestamps
    end
  end
end
