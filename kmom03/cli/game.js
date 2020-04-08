/**
 * A module for game Guess the number I'm thinking of.
 */
"use strict";

class Game {
    /**
     * @constructor
     */
    constructor() {
        this.thinking = -1;
    }

    /**
     * Init the game and guess the number.
     *
     * @returns void
     */
    init() {
        this.thinking = Math.round(Math.random() * 100 + 1);
    }

    /**
     * Check if the guess is correct or not.
     *
     * @param {integer} guess The number being guessed.
     *
     * @returns {boolean} True if guess matches thinking, else False.
     */
    check(guess) {
        return guess === this.thinking;
    }
}

module.exports = Game;
