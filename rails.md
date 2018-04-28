### Welcome to Rails Notes!

### What is Rails?
- a server-side framework that receives and parses HTTP requests, generates and returns HTTP responses to clients


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


### What is the Asset Pipeline?
- According to the official Rails guide, it's a **framework that concatenates and compresses (or minify) JavaScript and CSS assets.**
- Implemented using [sprockets-rails](https://github.com/rails/sprockets) gem, and is enabled by default.


### What are some of its main features?
1. Asset Concatenation
    - Sprockets gem concatenates all JS files into one master .js file, and CSS files into one master .css file. 
        - Sprockets use manifest files (i.e. application.js or application.css), which contain directive, or instructions that tell Sprockets which files to require in order to build a single CSS or JS file.
        - open `rails s` and visit `localhost:3000/assets/application.js`, you'll get a file containing all your application's JavaScript. 
    - This means that the number of requests made by the browser to render a web page is significantly reduced.
        - web browsers can only make a limited number of requests in parallel. By reducing the number of requests, your application can load faster.
    - Additional notes if interested: 
        - The files are cached in the browser because Rails inserts a SHA256 fingerprint into each filename.
        - Whenever you change the contents in the file, the fingerprint is automatically altered, invalidating the cache.

2. Asset Minificaiton and Compression
    - This means that whitespace and comments are removed in CSS and JS files.

3. Precompilation 
    - By default, the assets are automatically cached and served by the Rack middleware. 
    - However, if you want to have the web server itself serve and host assets, you can precompile the assets into the `/public` directory using `rake assets:precompile`, so they can be easily accessible from the web server, like Apache or NGinx.

    
4. Preprocessing
    - Asset files can be coded using higher-level languages, which then precompiles it down to actual assets. 
    - This means you can append a supported file type extension (or preprocessor extension) to an asset file: `stuff.js.coffee`, `stuff.txt.erb`,  and you will be able to use CoffeeScript or ERB in your file. This is called adding a **preprocessor extension**.
    - Another example: `stuff.css.scss.erb`. This file first passes through the ERB processor, then SASS processor.
    - Supports SASS for CSS, CoffeeScript for JS, and ERB for both.
    - For more info: check out the `Tilt` gem.


### How do we manage assets?
- Any file or subdirectory created within `/app/assets`, `/lib/assets`, or `vendor/assets` directory can be accessible in URL. 
- These other asset directories are used for non-app related assets. Assets not maintained by you, like a jQuery plugin JS file can be stored in `vendor/assets`. Assets that are maintained by you but are not specific to the app, or shared across apps can be stored in `lib/assets`.



### Useful CLI and VSCode commands
- To start server in production: `rails s -e production`
- `Shift + Command + V` opens preview of markdown

### Additional Resources
- [railscasts in general](http://railscasts.com/episodes) - Ryan Bates
- [Asset Pipeline for Rails 3.1](http://railscasts.com/episodes/279-understanding-the-asset-pipeline?view=asciicast) - Ryan Bates
- [More on Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html) - Rails Guides
