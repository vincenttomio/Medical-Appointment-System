class FixUsersTable < ActiveRecord::Migration[7.0]
  def change
    # Remover a coluna 'type' se existir
    if column_exists?(:users, :type)
      remove_column :users, :type, :string
    end
    
    # Adicionar a coluna 'role' apenas se não existir
    unless column_exists?(:users, :role)
      add_column :users, :role, :string, null: false, default: 'patient'
    end
  end
end