class AddWhomToEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :whom, :string
  end
end
