#!/usr/bin/env bash
#
# Recreate and reset the database to be as after part II.
#
echo ">>> Reset skolan to after part 1"
echo ">>> Recreate the database (as root)"
mysql -uroot skolan < setup.sql > /dev/null

file="ddl_all.sql"
echo ">>> Create tables and views ($file)"
mysql -uuser skolan < $file > /dev/null

file="insert.sql"
echo ">>> Insert the tables with content ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_update_lonerevision.sql"
echo ">>> Do the pay review ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_insert_csv.sql"
echo ">>> Importera Excel till tabell ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_join2.sql"
echo ">>> Skapar vyn v_planering ($file)"
mysql -uuser skolan < $file > /dev/null

echo ">>> Check Lönesumman = 305000, Kompetens = 8."
mysql -uuser skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"
echo ">>> Check Lönesumman = 330242, Kompetens = 19."
mysql -uuser skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
