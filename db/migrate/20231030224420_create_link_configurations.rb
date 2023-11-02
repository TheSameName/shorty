class CreateLinkConfigurations < ActiveRecord::Migration[7.1]
  def change
    create_table :link_configurations do |t|
      t.belongs_to :link, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
