import React from 'react';
import Tile from './tile'

export default class Board extends React.Component {
    render() {
        const grid = this.props.board.grid

        const content = grid.map((row, rowIdx) => {
            const tiles = row.map((tile,tileIdx)=> {
                return(
                    <Tile key={tileIdx} 
                          tile={tile} 
                          updateGame = {this.props.updateGame}>
                    </Tile>
                )
            })
            return(
                <div key={rowIdx}
                     className= 'row'>
                    {tiles}
                </div>
            )
        })

        return <div className="board">{content}</div>; 
    }
}