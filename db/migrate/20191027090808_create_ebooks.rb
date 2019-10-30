class CreateEbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :ebooks do |t|
      t.string :title
      t.references :provider, foreign_key: true
      t.integer :rel_id

      t.index [:provider_id, :rel_id], unique: true

      t.timestamps
    end
  end
end
