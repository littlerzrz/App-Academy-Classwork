import React from 'react';
export default class TodoListItem extends React.Component {
    render (){
        return(
            <li>{  this.props.todo.title } </li>
        )
    }
}