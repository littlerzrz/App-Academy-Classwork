import React from 'react';
import TodoDetailView from './todo_detail_view';

export default class TodoListItem extends React.Component {
    constructor(props) {
        super();
        this.state = {detail: false}

        this.clickToRemove = this.clickToRemove.bind(this)
        this.updateTodo = this.updateTodo.bind(this)
        this.toggleDetail = this.toggleDetail.bind(this)
    }
    
    clickToRemove(id) {
        return e => {
    e.preventDefault();
            this.props.removeTodo(id)
        }
    }

    updateTodo(todo) {
        return e => { 
            todo.done = !todo.done
            this.props.receiveTodo(todo);
        }
    }

    toggleDetail() {
        this.setState({
            detail: !this.state.detail
        })
    }

    render() {
        const todo = this.props.todo
        const content = ( this.state.detail ?
          <TodoDetailView todo={todo} clickToRemove={this.clickToRemove} /> : ''
        );

        return (
          <div>
            <h2 onClick={this.toggleDetail}>{todo.title} </h2>
            <button onClick={this.updateTodo(todo)}>
              {todo.done ? "Undone" : "Done"}{" "}
            </button>
            {content}
          </div>
        );
    }
}