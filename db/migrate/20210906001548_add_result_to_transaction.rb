class AddResultToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :result, :integer, default: 0, null: true
  end
end
