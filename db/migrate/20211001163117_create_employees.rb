class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.string :phone
      t.integer :salary

      t.timestamps
    end
  end
end
