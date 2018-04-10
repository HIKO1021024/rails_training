class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string :user_id
      t.string :title
      t.string :info

      t.timestamps
    end
  end
end
