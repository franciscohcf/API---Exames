server:
	@docker run \
		-v $(CURDIR):/app \
		-v rubygems_clinickr:/usr/local/bundle \
		-w /app \
		-p 3000:3000 \
		ruby \
		bash -c "ruby server.rb -s puma"

