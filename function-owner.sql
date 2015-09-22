SELECT 'ALTER FUNCTION '
            || quote_ident(n.nspname) || '.' 
            || quote_ident(p.proname) || '(' 
            || pg_catalog.pg_get_function_identity_arguments(p.oid)
            || ') OWNER TO acres5;'
FROM   pg_catalog.pg_proc p
JOIN   pg_catalog.pg_namespace n ON n.oid = p.pronamespace
--WHERE  n.nspname = 'doc';
WHERE  n.nspowner != 10;
