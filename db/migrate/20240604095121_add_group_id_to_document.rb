class AddGroupIdToDocument < ActiveRecord::Migration[7.1]
  def change
    add_reference :documents, :group, null: false, foreign_key: true
  end
end
