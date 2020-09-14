import { connect } from "react-redux";
import TodoList from "./todo_list"
import TodoListItem from "./todo_list_item";

const mapStateToProps =(state) => ({
    todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
    receiveTodo: todo => dispatch(receiveTodo(todo)),
    removeTodo: index => dispatch(removeTodo(index))
});

export const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export const TodoListItemContainer =  connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoListItem)