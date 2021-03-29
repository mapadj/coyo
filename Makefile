postgres:
	docker run --name postgresCoyo -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgresCoyo createdb --username=root --owner=root coyo

dropdb:
	docker exec -it postgresCoyo dropdb coyo

migrateup:
	migrate -path migration -database "postgresql://root:secret@localhost:5432/coyo?sslmode=disable" -verbose up

migrateup1:
	migrate -path migration -database "postgresql://root:secret@localhost:5432/coyo?sslmode=disable" -verbose up 1

migratedown:
	migrate -path migration -database "postgresql://root:secret@localhost:5432/coyo?sslmode=disable" -verbose down

migratedown1:
	migrate -path migration -database "postgresql://root:secret@localhost:5432/coyo?sslmode=disable" -verbose down 1

run:
	py coyo.py

.PHONY: postgres createdb dropdb migrateup migratedown migrateup1 migratedown1
