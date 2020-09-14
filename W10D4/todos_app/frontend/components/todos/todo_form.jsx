import React from 'react';
import { uniqueId } from '../../util/id_gen';

export default class TodoForm extends React.Component {
    constructor(props) {
        super();
        this.state = {
            title: '',
            body: '',
            done: false
        };
        this.handleChange = this.handleChange.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }
    
    handleChange(type){
       return e => this.setState({[type]: e.target.value})
    }

    handleSubmit(e){
        e.preventDefault();
        const todo = Object.assign( {id: uniqueId()}, this.state)
        this.props.receiveTodo(todo)
        this.setState({
            title:'',
            body:''
        })
    }

    render() {
       return (
       <form onSubmit={this.handleSubmit}>
          <label>Title:</label>
          <input
            type="text"
            value={this.state.title}
            onChange={this.handleChange('title')}
          ></input>

          <label>Body:</label>
          <input
            type="textarea"
            value={this.state.body}
            onChange={this.handleChange('body')}
          ></input>


          {/* <input type="submit" value="Add Tag"></input> */}
          <input type="submit" value="Create Todo!"></input>
        </form>
        )
    }
}