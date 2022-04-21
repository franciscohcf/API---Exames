require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'clinickpg',
  username: 'clinick',
  password: 'clinick',
  database: 'clinickdb'
)

class TestResults < ActiveRecord::Base
  validates :cpf, uniqueness: true
end
