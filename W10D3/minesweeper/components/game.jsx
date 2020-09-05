import React from 'react'
import Board from './board'
import * as Minesweeper from '../minesweeper'

export default class Game extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            board: new Minesweeper.Board(9, 9)
        }
        this.updateGame = this.updateGame.bind(this)
    }

    updateGame(tile, flagging) {
        flagging ? tile.toggleFlag() : tile.explore();
        this.setState({ board: this.state.board })
    }

    render(){
        const board = this.state.board;
        
        if (board.lost()) {
            alert("you lost! Bitch ass")
        } else if(board.won()) {
            alert("you won! Bitch ass")
        }

        return (
            <Board board = {this.state.board} 
                   updateGame = {this.updateGame}>
            </Board>
        )
    }

}