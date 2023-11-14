class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :owner, polymorphic: true
      t.string :type, null: false, index: true

      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
  end
end
