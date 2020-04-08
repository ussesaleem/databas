/**
 * Collects information from the database and presents it, using the
 * functions viewTeachers and teacherAsTable.
 *
 * @author Usama Saleem
 */
"use strict";

const mysql = require("promise-mysql");
const config = require("./config.json");
let utils1 = require("./viewTeachers.js");
let utils2 = require("./kompetens.js");
let utils3 = require("./lon.js");
let utils4 = require("./searchTeachers.js");
let utils5 = require("./nylon.js");

let teacher = {
    larare: async function() {
        const db = await mysql.createConnection(config);

        let str;

        str = await utils1.viewTeachers(db);
        console.table(str);

        db.end();
    },
    kompetens: async function() {
        const db = await mysql.createConnection(config);

        let str;

        str = await utils2.kompetens(db);
        console.table(str);

        db.end();
    },
    lon: async function() {
        const db = await mysql.createConnection(config);

        let str;

        str = await utils3.lon(db);
        console.table(str);

        db.end();
    },
    sok: async function(search) {
        const db = await mysql.createConnection(config);
        let str;

        str = await utils4.searchTeachers(db, search);
        console.table(str);

        db.end();
    },
    nylon: async function(akronym, nylon) {
        const db = await mysql.createConnection(config);
        let str;

        str = await utils5.nylon(db, akronym, nylon);
        console.table(str);

        db.end();
    }
};

module.exports = teacher;
