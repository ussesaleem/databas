/**
 * Collects information from the database and presents it, using the
 * functions viewTeachers and teacherAsTable.
 *
 * @author Usama Saleem
 */
"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");
let utils = require("./viewTeachers.js");

/**
 * Main function.
 * @async
 * @returns void
 */

(async function() {
    const db = await mysql.createConnection(config);
    let str;

    str = await utils.viewTeachers(db);
    console.info(str);

    db.end();
})();
