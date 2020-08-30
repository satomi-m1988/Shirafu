class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_id, :string
    add_column :users, :introduction, :text
    add_column :users, :history, :text
    add_column :users, :favorite_alcohol, :text
    add_column :users, :adult, :boolean
  end
end
