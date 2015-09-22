owner=acres5
database=deathstar
host=test-db1

for schema in `psql -U postgres -h $host -w -qAt -c "select distinct schemaName from pg_tables where tableOwner  = '$owner' order by schemaName;" $database ` ;
  do psql -U postgres -h $host -w -c "grant usage on schema $schema to public" $database;
  for table in `psql -U postgres -h $host -w -qAt -c "select distinct tableName from pg_tables where tableOwner  = '$owner' and schemaName = '$schema';" $database ` ;
    do psql -U postgres -h $host -w -c "grant select, references on table $schema.$table to public" $database; 
  done
done


