# README

This project is API application that consumes a websocket server with inventory update messages, and stores them in the database for consuming with GraphQL.

# INSTALLATION

The project includes a Dockerfile and a docker-compose file that bootstraps everything needed to run the API and GraphiQL for running the queries.

GraphiQL is mounted on port https://localhost:3001/graphql, and the API is on the usual https://localhost:3000

# VERSIONS

This app uses Ruby 3.1.0 and Rails 7.0.3, and is connected to MySQL 8

# EXAMPLE QUERIES

In the folder example_queries lies files with the most common queries, so it's as simple as copying the query from there and pasting on GraphiQL, and tweaking as you see fit. GraphiQL includes the schema explorer that can be used to customize anything in the queries.

# ASSUMPTIONS

As this is an example application, some things weren't implemented for the sake of simplicity. That includes:

- CORS allowing everything from localhost
- Not adding authentication / authorization
- Some rubocop rules are ignored
- The docker entrypoint for the API is doing the creation and migration of the database (that's not a good practice)
