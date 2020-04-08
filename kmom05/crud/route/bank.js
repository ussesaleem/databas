/**
 * Route for bank.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const bank    = require("../src/bank.js");
const sitename   = "| The Bank";
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("bank/index", data);
});

router.get("/balance", async (req, res) => {
    let data = {
        title: "Account balance | The Bank"
    };

    data.res = await bank.showBalance();

    res.render("bank/balance", data);
});

router.get("/create", async (req, res) => {
    let data = {
        title: "Create account | The Bank"
    };

    res.render("bank/create", data);
});

router.post("/create", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await bank.createAccount(req.body.id, req.body.name, req.body.balance);
    res.redirect("/bank/balance");
});

router.get("/account/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Account ${id} ${sitename}`,
        account: id
    };

    data.res = await bank.showAccount(id);

    res.render("bank/account-view", data);
});

router.get("/edit/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Edit account ${id} ${sitename}`,
        account: id
    };

    data.res = await bank.showAccount(id);

    res.render("bank/account-edit", data);
});

router.post("/edit", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await bank.editAccount(req.body.id, req.body.name, req.body.balance);
    res.redirect(`/bank/edit/${req.body.id}`);
});

router.get("/delete/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Delete account ${id} ${sitename}`,
        account: id
    };

    data.res = await bank.showAccount(id);

    res.render("bank/account-delete", data);
});

router.post("/delete", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await bank.deleteAccount(req.body.id, req.body.name, req.body.balance);
    res.redirect(`/bank/balance`);
});

module.exports = router;
