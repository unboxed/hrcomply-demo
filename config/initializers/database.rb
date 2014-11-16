unless ActiveRecord::SchemaMigration.table_exists?
  ActiveRecord::SchemaMigration.create_table
end

if defined?(ActiveRecord::ConnectionAdapters::MSSQLAdapter)
  ActiveRecord::Base.connection.tap do |connection|
    if connection.is_a?(ActiveRecord::ConnectionAdapters::MSSQLAdapter)
      unless connection.index_exists?(:schema_migrations, :version, name: 'idx_schema_migrations_version')
        connection.execute <<-SQL
          CREATE CLUSTERED INDEX [idx_schema_migrations_version] ON [schema_migrations] ([version])
        SQL
      end

      Time::DATE_FORMATS[:db] = "%Y-%m-%dT%H:%M:%S"
    end
  end
end

if ActiveRecord::Migrator.needs_migration?
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_path)
end
