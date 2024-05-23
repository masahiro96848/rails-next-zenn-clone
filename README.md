## rails new
```
docker compose run --rm rails rails new . --force --api --database=mysql --skip-action-cable --skip-sprockets --skip-turbolinks --skip-webpack-install --skip-test --skip-bundle
```

## bundle install
```
docker compose run --rm rails bundle install
```

## dockerの立ち上げ
```
docker compose build --no-cache

docker compose up -d
```

## コンテナ起動とサーバー起動を分離(railsコンテナ)
```
docker compose exec rails /bin/bash

## dbコンテナに入って
rails s -b '0.0.0.0'
```


## サーバーアクセス
http://localhost:3000/

## コンテナ起動(nextコンテナ)
```
docker compose exec next /bin/bash
```

## nextサーバー起動(nextコンテナ)
```
npm run dev
```


## rubocop実行(railsコンテナ)
```
rubocop
```

## rubocop自動修正(railsコンテナ)
```
rubocop -A
```

## lintの実行(nextコンテナ)
```
npm run lint
```

## lintの自動修正(nextコンテナ)
```
npm run format
```
