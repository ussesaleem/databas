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

async function searchTeachers(db, search) {
    let sql;
    let res;
    let like = `%${search}%`;

    sql = `
        SELECT
            *
        FROM v_larare
        WHERE
            akronym LIKE ?
            OR fornamn LIKE ?
            OR efternamn LIKE ?
            OR avdelning LIKE ?
            OR lon = ?
            OR kompetens LIKE ?
        ORDER BY akronym;
    `;
    res = await db.query(sql, [like, like, like, like, search, like]);
    return res;
}

module.exports = {
    "searchTeachers": searchTeachers
};
