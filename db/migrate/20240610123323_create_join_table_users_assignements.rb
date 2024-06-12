class CreateJoinTableUsersAssignements < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :assignements do |t|
      t.index :user_id
      t.index :assignement_id
    end
  end
end
