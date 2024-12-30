FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:0-18

# Install PostgreSQL
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install postgresql postgresql-contrib

# Switch to the postgres user and set up the database
USER postgres
RUN /etc/init.d/postgresql start && \
    psql --command "CREATE USER postgres WITH SUPERUSER PASSWORD 'Anusha@400';" && \
    createdb -O myuser mydatabase

# Switch back to node user
USER node