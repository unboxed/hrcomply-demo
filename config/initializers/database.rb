if ActiveRecord::Migrator.needs_migration?
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_path)
end
