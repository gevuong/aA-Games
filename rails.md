- Rack

- N+1 queries


- Asset Pipeline
    - Uses Rails  [sprockets](https://github.com/rails/sprockets) to package web assets.
    - To precompile assets into `/public` directory so web server handles serving and hosting of assets, run the following command: `rake assets:precompile`. Note: I never tried it before.


#### Useful CLI commands
- To start server in production: `rails s -e production`

#### Additional Resources
- [railscasts](http://railscasts.com/episodes) - Ryan Bates
- [Asset Pipeline for Rails 3.1](http://railscasts.com/episodes/279-understanding-the-asset-pipeline?view=asciicast) - Ryan Bates
- [More on Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html) - Rails Guides
