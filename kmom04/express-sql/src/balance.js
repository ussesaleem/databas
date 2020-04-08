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

async function balance(db) {
    let sql;
    let res;

    sql = `
    SELECT
        *
    FROM
        account
    `;
    res = await db.query(sql);
    return res;
}

module.exports = {
    "balance": balance
};
