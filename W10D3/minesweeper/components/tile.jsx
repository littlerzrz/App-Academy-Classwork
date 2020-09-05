import React from 'react';

export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            
        }
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(event) {
        const flagging = event.altKey
        const tile = this.props.tile
        this.props.updateGame(tile, flagging) 
    }


    render() {
        let content, klass;
            if (this.props.tile.explored){
                if (this.props.tile.bombed) {
                  content = "\u2622";
                  klass = "bombed";
                }
                else{
                    this.props.tile.adjacentBombCount() === 0
                    ? (content = "")
                    : (content = `${this.props.tile.adjacentBombCount()}`);
                    klass = "explored"
                }
            } else if (this.props.tile.flagged) {
               content = "\u2691";
               klass = "flagged";
            } else {
               content = "";
               klass = "unexplored";
            }

        klass = `tile ${klass}`;

        return(
            <div className={klass}
                 onClick = {this.handleClick}>
                {content}
            </div>
        )
        
    }


}