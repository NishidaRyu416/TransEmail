class AddPurposeToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :purpose, :string
  end
end
