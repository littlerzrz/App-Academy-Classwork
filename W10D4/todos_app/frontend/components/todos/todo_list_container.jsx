import { connect } from "react-redux";
import { removeTodo, receiveTodo } from "../../actions/todo_actions";
import TodoList from "./todo_list";


const mapStateToProps =(state) => ({
    todos: allTodos(state)
});

const mapDispatchToProps = (dispatch) => ({
    receiveTodo: todo => dispatch(receiveTodo(todo)),
    removeTodo: id => dispatch(removeTodo(id))
});

export const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

