--
-- Delete user "dbwebb" if exist
--
DROP USER IF EXISTS 'dbwebb'@'%';

--
-- Create new root user called "dbwebb"
--
CREATE USER 'dbwebb'@'%'
	IDENTIFIED WITH mysql_native_password -- Only MySWQL > 8.0.4
    BY 'password'
;

--
-- Give full access
--
GRANT ALL PRIVILEGES
	ON *.*
	TO 'dbwebb'@'%'
	WITH GRANT OPTION
;

-- --
-- -- Check what version of MySQL you have
-- --
-- SHOW VARIABLES LIKE "%version%";

--
-- Check the status for users root, dbwebb and user.
--
SELECT
    User,
    Host,
    Grant_priv,
    plugin
FROM mysql.user
WHERE
    User IN ('root', 'dbwebb', 'user')
ORDER BY User
;

-- -- Create user dbwebb and user and check status on user root, dbwebb and user
-- From the course repo
-- mysql -uroot -p < example/sql/create-user-dbwebb.sql
-- mysql -uroot -p < example/sql/create-user-user.sql
-- mysql -t -uroot -p < example/sql/check-users.sql