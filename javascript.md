### Hi, Welcome to JavaScript Notes

### Parallelism vs Concurrency

#### Concurrency
- JS is able to run operations through the
- how JS operates with asynchronicity.
- Can have single thread and be concurrent.
- processes run independently of one another, but they do not necessarily run at the same time.

#### Parallelism
- multiple processes can run at exactly the same time.

#### JS Engine
- Chrome V8
- Shakra (Microsoft uses)
- The engine runs off of a heap and call stack.
- Heap
    - all memory allocation is stored in a heap
- Call Stack
    - in what order
    - gets executed top to bottom

#### JS Runtime Environment
- What makes up the JS Runtime Environment?
    - In the Runtime environment, multiple API calls can run at the same time, unlike the call stack in JS engine.
    - Web APIs (it's what makes JS asynchronous)
        - These do not get to execute in the call stack.
        - Examples: DOM, AJAX (XMLHTTPRequest), Timeout (setTimeout)
        - The return values of the web API (i.e. Promise.all([]) get resolved, callback) get placed in the task queue.

    - Task Queues
        - Whatever we place in the API, get placed in the task queue.
    - Event Loop
        - **Takes whatever in the task queue, and puts it in the call stack when the call stack is empty
        - That's the only job it does, to monitor the task queue and call stack.**
        - Under the hood, it actually runs through a set of cycles. There are 7 different spots the event loop checks. It's essentially a bunch of while loops.

- Any browser is a runtime environment (i.e. Chrome)
- NodeJS
- NodeJS allows us to do things, that other runtime environments don't have. And vice versa.

#### Asynchronicity in JS
- Callback
    - A function passed into a function as an argument, which is then invoked inside the outer function after an event occurs.
- Promise
    - A Promise object that represents the eventual completion or failure of an asynchronous operation.
    - Promise.all(), great for making multiple API calls, instead of chaining multiple .then().
- Async/Await
    - Async functions return Promise objects, not undefined
    - Exists to make writing promises easier.
    - Async/Await pauses synchronous code, then when await statements are resolved, it returns both synchronous and asynchronous values. Promise.all() doesn't do that.
