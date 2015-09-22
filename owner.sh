user=postgres
schema=data
owner=pathiq
database=ihq_new
host=ha-db.dl.amirsys.local

psql -U $user -h $host -c "alter schema $schema owner to $owner" $database; 

for tbl in `psql -U $user -h $host -w -qAt -c "select tablename from pg_tables where schemaname = '$schema';" $database ` ;
  do psql -U $user -h $host -w -c "alter table $schema.$tbl owner to $owner" $database; 
  done

