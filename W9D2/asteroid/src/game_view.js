function GameView(game,ctx) {
    this.game = game;
    this.ctx = ctx;
}



GameView.prototype.start = function() {
    // let moveObjs = setInterval(this.game.moveObjects(), 20);
    // let drawObjs = setInterval(this.game.draw(this.ctx), 20); 
    setInterval(alert('hello!'), 200)
}

module.exports = GameView;