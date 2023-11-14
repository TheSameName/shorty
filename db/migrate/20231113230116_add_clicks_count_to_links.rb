class AddClicksCountToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :clicks_count, :integer, default: 0
  end
end
