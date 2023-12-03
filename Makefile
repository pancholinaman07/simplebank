#postgres:
#	docker run --name postgres -p 5431:5431 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

#createdb:
#	docker exec -it postgres createdb --username=root --owner=root simple_bank

#dropdb:
#	docker exec -it postgres dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:3007@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:3007@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc

#makefile fucked up