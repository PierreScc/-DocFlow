class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :document_id
      t.string :title
      t.string :category

      t.timestamps
    end
  end
end
