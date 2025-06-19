# frozen_string_literal: true

# Creates the notes database
class CreateNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :notes do |t|
      t.string :note_id
      t.references :item, null: false, foreign_key: true
      t.string :msg
      t.references :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
