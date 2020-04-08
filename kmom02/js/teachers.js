/**
 * To verify that mysql is installed and is working.
 * Create a connection to the database and execute
 * a query without actually using the database.
 */
"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");

/**
 * Main function.
 * @async
 * @returns void
 */

(async function() {
    const db = await mysql.createConnection(config);
    let sql;
    let res;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);
    console.info(res);

    let data;

    data = JSON.stringify(res, null, 4);
    console.info(data);

    db.end();
})();
