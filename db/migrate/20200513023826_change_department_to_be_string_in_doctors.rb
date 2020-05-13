class ChangeDepartmentToBeStringInDoctors < ActiveRecord::Migration[5.0]
  def change
    change_column :doctors, :department, :string
  end
end
