class ChangeDataAdultToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :adult, :string
  end
end
