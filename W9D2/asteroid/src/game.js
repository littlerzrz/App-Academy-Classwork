const Util = require('./utils.js')
const Asteroid = require('./asteroid.js')

Game.DIM_X = 800; 
Game.DIM_Y = 1000; 
Game.NUM_ASTEROIDS = 10;

function Game(){
    this.asteroids = [];  
    this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
    for(i = 0; i < Game.NUM_ASTEROIDS; i ++) {
        let new_pos = this.randomPosition();
        let new_asteroid = new Asteroid({pos: new_pos});

        this.asteroids.push(new_asteroid);
    }
}

Game.prototype.randomPosition = function () {
    return [Math.random() * Game.DIM_X, Math.random() * Game.DIM_Y]
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    this.asteroids.forEach((asteroid) => {
        asteroid.draw(ctx);
    })
    console.log(this)
}

Game.prototype.moveObjects = function () {
    this.asteroids.forEach((asteroid) => {
        asteroid.move();
    })
}

module.exports = Game;