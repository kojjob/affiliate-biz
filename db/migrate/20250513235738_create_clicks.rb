class CreateClicks < ActiveRecord::Migration[8.0]
  def change
    create_table :clicks do |t|
      t.references :affiliate_link, null: false, foreign_key: true
      t.string :ip_hash
      t.string :referrer
      t.string :user_agent

      t.timestamps
    end
  end
end
