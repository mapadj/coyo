# README

- install dependencies
```
python3 -m pip install -r requirements.txt
```

- create database
```
make postgres
make createdb
make migrateup
```
- first create coyo user and api key

- rename .env to .env_BACKUP file and fill in your private data

- run Importer
```
make run
```

# Results
- data in result/dump.sql
- screenshot in result/screenshot_dump.png