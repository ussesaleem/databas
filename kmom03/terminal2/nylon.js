/**
 * Holds the viewTeachers function which is used in teachers.js.
 *
 * @author Usama Saleem
 */
"use strict";

/**
 * Gets information out of the database function allowing searches.
 * @async
 * @returns void
 */

async function nylon(db, akronym, nylon) {
    let sql;
    let res;

    sql = `
        UPDATE
            larare
        SET
            lon = ?
        WHERE
            akronym = ?;
    `;
    res = await db.query(sql, [nylon, akronym]);
    return res;
}

module.exports = {
    "nylon": nylon
};
