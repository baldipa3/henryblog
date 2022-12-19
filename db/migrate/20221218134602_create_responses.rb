class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.text :answer
      t.references :user, null: false, foreign_key: true
      t.references :enquiry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
