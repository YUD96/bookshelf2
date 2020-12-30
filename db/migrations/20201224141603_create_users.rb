Hanami::Model.migration do
  change do
    create_table :users do
			primary_key :id
			
			column :name, String, null: false
			column :mail, String, null: false
			column :password, String
			column :icon, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
