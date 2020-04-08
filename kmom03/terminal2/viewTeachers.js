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

async function viewTeachers(db) {
    let sql;
    let res;

    sql = `
        SELECT
            *
        FROM v_larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);
    return res;
}

module.exports = {
    "viewTeachers": viewTeachers
};
