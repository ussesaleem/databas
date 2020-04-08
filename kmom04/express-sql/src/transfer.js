/**
 * Collects information from transfer.
 *
 * @author Usama Saleem
 */
"use strict";

const mysql = require("promise-mysql");
const config = require("../config//db/bank.json");
let utils1 = require("./transfermoney.js");
let utils2 = require("./balance.js");

let transfer = {
    transfer: async function() {
        const db = await mysql.createConnection(config);

        await utils1.transferMoneytoEva(db);
        console.info(
            " (Moving 1.5 money from 1111 to 2222)" + "\n" +
            " Eva got 1.5 pengar, she is currently checking out her account " +
            "balance.");

        db.end();
    },
    balance: async function() {
        const db = await mysql.createConnection(config);

        let str;

        str = await utils2.balance(db);
        console.table(str);

        db.end();
    }
};

module.exports = transfer;
