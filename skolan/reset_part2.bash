#!/usr/bin/env bash
#
# Recreate and reset the database to be as after part II.
#
echo ">>> Reset skolan to after part 1"
echo ">>> Recreate the database (as root)"
mysql -uroot skolan < setup.sql > /dev/null

file="ddl.sql"
echo ">>> Create tables ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_insert.sql"
echo ">>> Insert into larare ($file)"
mysql -uuser skolan < $file > /dev/null

file="ddl_migrate.sql"
echo ">>> Alter table larare ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_update.sql"
echo ">>> Förbered lönerevision, grundlön larare ($file)"
mysql -uuser skolan < $file > /dev/null

file="ddl_copy.sql"
echo ">>> Kopiera till larare_pre innan lönerevisionen ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_update_lonerevision.sql"
echo ">>> Utför lönerevision ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_view.sql"
echo ">>> Skapa vyerna v_namn_alder och v_larare ($file)"
mysql -uuser -ppass skolan < $file > /dev/null

file="dml_join.sql"
echo ">>> Skapa vyn v_lonerevision ($file)"
mysql -uuser -ppass skolan < $file > /dev/null

echo ">>> Check Lönesumman = 305000, Kompetens = 8."
mysql -uuser skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"
echo ">>> Check Lönesumman = 330242, Kompetens = 19."
mysql -uuser skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
