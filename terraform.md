# Terraform 

## Load Order and Semantics

- Configuration files are loaded within the directory specified in alphabetical order.
- Files loaded must end in either `.tf` or `.tf.json` or the files will be ignored.
- 

## Data Sources

- Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration. 


## Questions

1. I noticed that only one terraform command (`terraform create`) is called during a Jenkins build. Is that right?

2. 