## Redux

### What you need to know

State management
- single source of truth
- read only
- unidirectional

- Allows us to organize huge application states
- quickly and efficiently debug because we know hwen why and how the state changes.

Having a state management helps us organize data being returned from different asynchronous API calls.


### Why Redux?
- lightweight: only 2kB
- separation of data organization from presentation
- relatively easy to start writing code
- flux has multiple store, that's the only difference.In redux, we divide state into slices, but we only have one store.

### Principles of Redux
- single source of truth
- state is read only
- changes are made through pure functions (i.e. reducers). This means that the output will always be the same if given the same input, no side effects.

### Redux Anatomy
- actions (i.e. tells store something to change, allows us to time travel)
    - function that returns an action
    - invoked action creators are typically we what dispatch to store

- reducers (i.e. actually makes the change to store)
    - every action we dispatch hits every reducer. Reducer listens to the action type
    - highly recommended to define a defaultState. Isn't necessary, but it helps with managing what state looks like.
- store (POJO)
    - Provider component handles subscription and unsubscription to state changes via listeners. In other words, Provider provides access to application state to React component.
    - allows state to be updated via dispatch(action).
