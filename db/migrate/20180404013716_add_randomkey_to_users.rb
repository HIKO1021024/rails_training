class AddRandomkeyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :randomkey, :string
  end
end
