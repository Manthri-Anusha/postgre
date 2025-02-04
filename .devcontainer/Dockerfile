FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:0-18

# Install PostgreSQL
USER root
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install postgresql postgresql-contrib

# Ensure PostgreSQL data is stored persistently
RUN mkdir -p /var/lib/postgresql/data && chown -R postgres:postgres /var/lib/postgresql/data

USER postgres
RUN /etc/init.d/postgresql start && \
    psql --command "CREATE USER myuser WITH SUPERUSER PASSWORD 'Anusha@400';" && \
    createdb -O myuser mydatabase

# Set PostgreSQL data directory to mounted volume
ENV PGDATA=/var/lib/postgresql/data

# Switch back to node user
USER node
