export const allTodos = ({todos}) => {
    return Object.values(todos)
}

export const stepsByTodoId = (state, todoId) => {
    const steps = Object.values(state.steps)
    return steps.filter(step => step.todoId === todoId)
}