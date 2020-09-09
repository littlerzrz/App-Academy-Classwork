import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root'
import configureStore from './frontend/store/store';
import { receiveTodos, receiveTodo } from "./frontend/actions/todo_actions";
import { allTodos } from './frontend/reducers/selectors';

const store = configureStore()
window.store = store;
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.allTodos = allTodos

document.addEventListener('DOMContentLoaded', ()=> {
    const root = document.getElementById('content')
    ReactDOM.render(< Root store= {store} />, root)
})

