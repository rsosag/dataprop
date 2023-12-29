class RenameTypeToOperationType < ActiveRecord::Migration[7.1]
  def change
    rename_column :properties, :type, :operation_type
  end
end
