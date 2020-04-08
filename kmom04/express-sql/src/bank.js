/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    "showBalance": showBalance,
    "transferMoneytoAdam": transferMoneytoAdam
};

const mysql = require("promise-mysql");
const config = require("../config/db/bank.json");
let utils1 = require("./transfermoney.js");
let db;

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showBalance() {
    return findAllInTable("account");
}

/**
 * Show all entries in the selected table.
 *
 * @async
 * @param {string} table A valid table name.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function findAllInTable(table) {
    let sql = `SELECT * FROM ??;`;
    let res;

    res = await db.query(sql, [table]);
    console.info(`SQL: ${sql} (${table}) got ${res.length} rows.`);

    return res;
}

/**
 * Tranfer money to Adam.
 *
 * @async
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function transferMoneytoAdam() {
    const db = await mysql.createConnection(config);

    await utils1.transferMoneytoAdam(db);

    db.end();
}
