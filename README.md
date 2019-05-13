# falcon-sample

## Version

- Ruby: `2.6.2`

## 実行

### puma
```
bundle exec puma -b tcp://0.0.0.0:9292 -t 16:16 config.ru
```

### falcon
```
bundle exec falcon -b http://0.0.0.0:9292 -n 1 -c config_async.ru
```
