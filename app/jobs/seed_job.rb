require 'sidekiq'
require './app/services/seed.rb'

class SeedJob
  include Sidekiq::Job

  def perform(file)
    Seed.to_db(file)
  end
end
