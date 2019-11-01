# frozen_string_literal: true

class CreateEbookReaders < ActiveRecord::Migration[6.0]
  def change
    create_table :ebook_readers do |t|
      t.references :ebook, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.index %i[ebook_id user_id], unique: true
      t.timestamps
    end
  end
end
