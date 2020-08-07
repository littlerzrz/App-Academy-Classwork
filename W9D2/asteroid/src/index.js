const Game = require('./game.js')
const GameView = require('./game_view.js')

document.addEventListener("DOMContentLoaded", function() {
    const canvas = document.getElementById('game-canvas');
    canvas.height = 800;
    canvas.width = 1000;
    const ctx = canvas.getContext("2d");
    const newGame = new Game()
    const view = new GameView(newGame, ctx)
    view.start()
});


