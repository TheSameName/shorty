class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :slug, index: { unique: true }

      t.timestamps
    end
  end
end
