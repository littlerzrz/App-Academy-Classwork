import { connect } from "react-redux";
import TodoList from "./todo_list"

const mapStateToProps =(state) => ({
    todos: allTodos(state)
});

const mapDispatchToProps = disPatch => ({
    receiveTodo: todo => dispatch(receiveTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);