class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :user_id
      t.string :group_id

      t.timestamps
    end
  end
end
