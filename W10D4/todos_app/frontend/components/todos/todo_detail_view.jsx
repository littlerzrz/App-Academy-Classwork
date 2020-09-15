import React from 'react';

export default class TodoDetailView extends React.Component {
    constructor(props) {
        super()
        

    }

    render() {
        const todo = this.props.todo;
        return (
          <div>
            <p>{ todo.body }</p>
            <button onClick={ this.props.clickToRemove(todo.id) }>Delete Todo</button>
          </div>
        );
    }
}