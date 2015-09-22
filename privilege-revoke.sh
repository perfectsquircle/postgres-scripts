owner=acres5
privelageRole=public
database=pbdeathstar
host=localhost

for schema in `psql -U postgres -h $host -w -qAt -c "select distinct schemaName from pg_tables where tableOwner  = '$owner' order by schemaName;" $database ` ;
  do psql -U postgres -h $host -w -c "revoke usage on schema $schema from $privelageRole" $database;
  for table in `psql -U postgres -h $host -w -qAt -c "select distinct tableName from pg_tables where tableOwner  = '$owner' and schemaName = '$schema';" $database ` ;
    do psql -U postgres -h $host -w -c "revoke select, references on table $schema.$table from $privelageRole" $database; 
  done
done


