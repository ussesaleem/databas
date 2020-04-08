/**
 * Holds the viewTeachers function which is used in teachers.js.
 *
 * @author Usama Saleem
 */
"use strict";

let utils = require("./teacherAsTable.js");

/**
 * Gets the information from database to feed into table function.
 * @async
 * @returns void
 */

async function viewTeachers(db) {
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
        ORDER BY akronym;
    `;
    res = await db.query(sql);
    str = utils.teacherAsTable(res);
    return str;
}

module.exports = {
    "viewTeachers": viewTeachers
};
