class CreateUserGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :user_groups do |t|
      t.string :user_id
      t.string :group_id

      t.timestamps
    end
  end
end
