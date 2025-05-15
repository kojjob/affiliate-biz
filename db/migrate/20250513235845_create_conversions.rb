class CreateConversions < ActiveRecord::Migration[8.0]
  def change
    create_table :conversions do |t|
      t.references :affiliate_link, null: false, foreign_key: true
      t.references :click, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
