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

async function searchTeachersBetween(db, min, max) {
    let sql;
    let res;
    let str;

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
            lon BETWEEN ${min} AND ${max}
            OR kompetens BETWEEN ${min} AND ${max}
        ORDER BY akronym;
    `;
    res = await db.query(sql, [min, max, min, max]);
    str = utils.teacherAsTable(res);
    return str;
}

module.exports = {
    "searchTeachersBetween": searchTeachersBetween
};
