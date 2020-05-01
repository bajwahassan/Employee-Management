class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.string :department
      t.string :address
      t.string :phone_number
      t.text :remarks
    end
  end
end
