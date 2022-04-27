server:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		-e REDIS_URL=redis://redis:6379/0 \
		-p 3000:3000 \
		--network clinickr \
		ruby \
		bash -c "ruby server.rb -s puma"

install.gems:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		ruby \
		bash -c "gem install sinatra puma pg activerecord redis sidekiq"

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

redis:
	@docker run \
		--rm \
		--name redis \
		--network clinickr \
		redis

sidekiq:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		-e REDIS_URL=redis://redis:6379/0 \
		--network clinickr \
		ruby \
		bash -c "sidekiq -r ./app/jobs/seed_job.rb"



