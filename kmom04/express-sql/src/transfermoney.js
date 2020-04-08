/**
 * Holds the viewTeachers function which is used in teachers.js.
 *
 * @author Usama Saleem
 */
"use strict";

/**
 * Gets the information from database to feed into table function.
 * @async
 * @returns void
 */

async function transferMoneytoEva(db) {
    let sql;
    let res;

    sql = `
    START TRANSACTION;

    UPDATE account
    SET
    balance = balance + 1.5
    WHERE
    id = "2222";

    UPDATE account
    SET
    balance = balance - 1.5
    WHERE
    id = "1111";

    COMMIT;
    ROLLBACK;
    `;
    res = await db.query(sql);
    return res;
}

async function transferMoneytoAdam(db) {
    let sql;
    let res;

    sql = `
    START TRANSACTION;

    UPDATE account
    SET
    balance = balance - 1.5
    WHERE
    id = "2222";

    UPDATE account
    SET
    balance = balance + 1.5
    WHERE
    id = "1111";

    COMMIT;
    ROLLBACK;
    `;
    res = await db.query(sql);
    return res;
}

module.exports = {
    "transferMoneytoEva": transferMoneytoEva,
    "transferMoneytoAdam": transferMoneytoAdam
};
