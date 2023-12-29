class AddUserRefToProperties < ActiveRecord::Migration[7.1]
  def change
    add_reference :properties, :user, null: false, foreign_key: true
  end
end
