function GameView(game,ctx) {
    this.game = game;
    this.ctx = ctx;
}



GameView.prototype.start = function() {
//     let obj = this;
//     setInterval(function(){
//         obj.render()
//     }, 20);
// }

// GameView.prototype.render = function(){
//     this.game.moveObjects();
//     this.game.draw(this.ctx)
// }
    setInterval(function(){
        this.game.moveObjects();
        this.game.draw(this.ctx)
    }.bind(this), 20)

}


module.exports = GameView;