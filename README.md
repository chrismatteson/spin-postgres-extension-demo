# Postgres HTTP Extension Docker Image
This repository contains a Dockerfile to build an image of Postgres with [pgsql-http](https://github.com/pramsey/pgsql-http) extension compiled and installed. In order to use this extension, the following command should be run once connected into the database:

    CREATE EXTENSION http;

See the README in the repo linked above for general usage.

## Examples with Spin:

Fetch content from app:

    SELECT content FROM http_get('https://abc.fermyon.app');

Post content to an app and recieve a response:

    SELECT content FROM http_post('https://calculator.fermyon.app/api','5*11','text/plain');
         

