echo "Creating roles landchecker"
psql -U postgres -c "CREATE ROLE landchecker WITH LOGIN PASSWORD 'password' SUPERUSER INHERIT CREATEDB CREATEROLE;"
psql -U postgres -c "CREATE ROLE pgsql SUPERUSER INHERIT CREATEDB CREATEROLE;"

echo "Creating template_postgis"
createdb -U landchecker -E utf8 template_postgis
psql -U landchecker -d template_postgis -U landchecker -c "CREATE EXTENSION postgis"

echo "Creating landchecker databases"
createdb -U landchecker -E utf8 -T template_postgis LandCheckerBackend_development
createdb -U landchecker -E utf8 -T template_postgis LandCheckerBackend_test
