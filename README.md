## Deploy
### Env
```shell
export SECRET_KEY_BASE=
export DATABASE_URL=ecto://user:pwd@host/db
```
### Command
```
  mix deps.get --only prod
  MIX_ENV=prod mix compile
  MIX_ENV=prod mix ecto.migrate
  MIX_ENV=prod mix assets.deploy
  PORT=4001 MIX_ENV=prod elixir --erl "-detached" -S mix phx.server
```
