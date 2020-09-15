
const stepsReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    switch(action.type) {
        case RECEIVE_STEPS:
            return { ... action.steps};
        case RECEIVE_STEP:
            nextState[action.step.id] = action.step
            return nextState;
        case REMOVE_STEP:
            delete nextState[action.id]
            return nextState;
        default:
            return state;
    }
}

export default stepsReducer;