class AddTermsAcceptedToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :terms_accepted, :boolean, null: false, default: false
    add_index :users, :terms_accepted
  end
end
