### Welcome to Rails Notes!

### What is Rails?
    - a server-side framework that receives and parses HTTP requests, generates and returns HTTP responses to clients
    - 

- Rack
    - middleware that sits between a web server (i.e. WEBrick, Puma) and application framework (i.e. Rails app), specifically, rails router.
    - purpose is to ensure that requests/responses are formatted a certain way so that every web server can interface every Ruby framework seamlessly.
    - Receives HTTP requests from the server, and generating responses using info from the router.

    - You can actually build a very simple Rack application that process requests and response 
    
- WEBrick and Puma
    - WEBrick is a HTTP server standard in Rails 4, is written in Ruby and easy to use and reliable, but is single-threaded (can handle only one request at a time), making it ideal for development.
    - Puma is a HTTP server standard in Rails 5, is multi-threaded, very fast, can handle multiple requests concurrently, and a great choice for a production server.

- CSRF (cross-site request forgery)
    - How does SQL injection relate with CSRF? 
    - 


- What about XSS (cross-site scripting)? XSS usually goes hand-in-hand with CSRF? 
    - XSS bypass all CSRF proections, and can read CSRF security token from a form or directly submit the form.
    - Countermeasures 
        - whitelist input filtering

- ActionController
    - Provides protection from CSRF (cross-site request forgery) attacks by checking the authenticity token in POST or PATCH requests. 

- REST
    - stands for Representational State Transfer
    - an architectural style for web services
    - RESTful web services are stateless, meaning each request/response is independent of any other request/response
    - The idea behind REST is that each HTTP operation (GET, POST, PATCH, UPDATE), with a particular resource, will produce predictable, standardized results. For example, a GET request to a resource with a specified id is expected to return data on that specific item, no matter what the resource is.




- Asset Pipeline
    - Uses Rails  [sprockets](https://github.com/rails/sprockets) to package web assets.
    - To precompile assets into `/public` directory so web server handles serving and hosting of assets, run the following command: `rake assets:precompile`. Note: I never tried it before.


#### Useful CLI commands
- To start server in production: `rails s -e production`

#### Additional Resources
- [railscasts](http://railscasts.com/episodes) - Ryan Bates
- [Asset Pipeline for Rails 3.1](http://railscasts.com/episodes/279-understanding-the-asset-pipeline?view=asciicast) - Ryan Bates
- [More on Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html) - Rails Guides
