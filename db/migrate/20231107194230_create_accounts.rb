class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :email,           null: false, index: { unique: true }
      t.string :password_digest, null: false

      t.boolean :verified, null: false, default: false # TODO: Jsonb instead of flags

      t.timestamps
    end
  end
end
