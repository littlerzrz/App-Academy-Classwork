import {conncet} from 'react-redux';
import { removeTodo } from '../../actions/todo_actions';
import TodoDetailView from './todo_detail_view';

export const MapDispatchToProps = (dispatch) => {
    removeTodo: id => dispatch(removeTodo(id))
}

export const TodoDetailViewContainer = connect(
  null,
  mapDispatchToProps
)(TodoDetailView);