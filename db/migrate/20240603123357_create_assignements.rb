class CreateAssignements < ActiveRecord::Migration[7.1]
  def change
    create_table :assignements do |t|
      t.string :user_id
      t.string :document_id
      t.string :comment

      t.timestamps
    end
  end
end
