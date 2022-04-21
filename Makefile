server:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		-p 3000:3000 \
		ruby \
		bash -c "ruby server.rb -s puma"

tests:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		ruby \
		bash -c "ruby tests.rb"

install.gems:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		ruby \
		bash -c "gem install sinatra puma byebug pg activerecord yaml"

pg.server:
	@docker run \
	  --rm \
	  --name clinickpg \
	  -e POSTGRES_USER=clinick \
	  -e POSTGRES_PASSWORD=clinick \
	  -e POSTGRES_DB=clinickdb \
	  -v clinick_db_data:/var/lib/postgresql/data \
	  --network clinickr \
	  postgres

psql:
	@docker exec -it clinickpg bash -c "psql -U clinick clinickdb"

db.migrate:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		--network clinickr \
		ruby \
		bash -c "ruby db/migrate/migration_test_results.rb"


irb:
	@docker run \
		-it \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		--network clinickr \
		ruby \
		bash -c "irb -r ./model/test_results"

seed:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		--network clinickr \
		ruby \
		bash -c "ruby seed.rb"

