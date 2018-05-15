class CreateUsersLists < ActiveRecord::Migration[5.1]
  def change
    create_table :users_lists do |t|
      t.references :list, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
