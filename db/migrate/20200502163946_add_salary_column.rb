class AddSalaryColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :salary, :integer
  end
end
