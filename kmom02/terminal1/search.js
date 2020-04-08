/**
 * Collects information from the database and presents it, using the
 * functions viewTeachers and teacherAsTable, with the ability to search
 * in the database.
 *
 * @author Usama Saleem
 */
"use strict";

const readline = require("readline");
const r1 = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
const mysql = require("promise-mysql");
const config = require("./config.json");
let utils = require("./searchTeachers.js");

/**
 * Search function.
 * @async
 * @returns void
 */

(async function() {
    const db = await mysql.createConnection(config);
    let str;

    r1.question("Ange sökord: ", async (search) => {
        str = await utils.searchTeachers(db, search);
        console.info(str);

        r1.close();
        db.end();
    });
})();
