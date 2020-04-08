/**
 * Holds the viewTeachers function which is used in teachers.js.
 *
 * @author Usama Saleem
 */
"use strict";

let utils = require("./teacherAsTable.js");

/**
 * Gets information out of the database function allowing searches.
 * @async
 * @returns void
 */

async function searchTeachers(db, search) {
    let sql;
    let res;
    let str;
    let like = `%${search}%`;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon,
            kompetens,
            fodd
        FROM larare
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
    str = utils.teacherAsTable(res);
    return str;
}

module.exports = {
    "searchTeachers": searchTeachers
};
