# Ubeer API 🍺

Ubeer API using [PostgREST](https://postgrest.org) and [Hasura](https://hasura.io).

## Usage

### Start database and API

```sh
# Use -d option to run containers in the background
docker-compose up -d

# View logs output form containers
docker-compose logs
```

Visit http://localhost:14000.

### Stop services

```sh
# Stop command will only stop the services
docker-compose stop

# Down command will stop the services and destroy resources
docker-compose down
```

### Connect to the database

```
docker exec -it ubeer-database psql -U postgres
```

### Authentication

Some requests bellow need to be authenticated as `authenticated_user` or `dev@ubeer.io` using a JWT token. You can generate one [here](https://jwt.io), or use the following one.

```
export TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYXV0aGVudGljYXRlZF91c2VyIn0.DpYcXq4Cd3g5vjWGwCETGZ3pYgnWcX3P-sAGkusHPpU
```

### CURL requests

#### Get all

https://postgrest.org/en/v9.0/api.html#tables-and-views

```sh
curl http://localhost:3000/todos
```

#### Filtering results

https://postgrest.org/en/v9.0/api.html#operators

```sh
curl http://localhost:3000/todos?done=eq.true
```

#### Ordering results

https://postgrest.org/en/v9.0/api.html#ordering

```sh
curl http://localhost:3000/todos?order=due.desc,done.asc
```

#### Pagination

https://postgrest.org/en/v9.0/api.html#limits-and-pagination

```sh
curl http://localhost:3000/todos?limit=5&offset=0
```

#### Format

https://postgrest.org/en/v9.0/api.html#response-format

```sh
curl http://localhost:3000/todos \
     -H "Accept: application/json"
```

#### Get one by id

```sh
curl http://localhost:3000/todos?id=eq.1 \
     -H "Accept: application/vnd.pgrst.object+json"
```

#### Create one

https://postgrest.org/en/v9.0/api.html#insertions-updates

```sh
curl http://localhost:3000/todos -X POST \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"task": "New task"}'
```

#### Create multiples rows

https://postgrest.org/en/v9.0/api.html#bulk-insert

```sh
curl http://localhost:3000/todos -X POST \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -d '[{"task": "New task 1"}, {"task": "New task 2"}]'
```

#### Update one by id

PUT replace a resource, meanwhile PATCH applies partial modifications.

https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT

https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PATCH

https://postgrest.org/en/v9.0/api.html#insertions-updates

https://postgrest.org/en/v9.0/api.html#put

```sh
curl http://localhost:3000/todos -X PATCH \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"done": true}'

curl http://localhost:3000/todos -X PUT \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"task": "New task", "done": true}'
```