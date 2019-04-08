class AddToToEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :to, :string
  end
end
