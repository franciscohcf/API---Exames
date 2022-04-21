require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'clinickpg',
  username: 'clinick',
  password: 'clinick',
  database: 'clinickdb'
)

class TestResults < ActiveRecord::Migration[5.2]
    def change
      create_table :test_results do |table|
        table.string :cpf
        table.string :name
        table.string :email
        table.date :birthday
        table.string :street_address
        table.string :city_address
        table.string :state_address
        table.string :doctor_crm
        table.string :doctor_crm_state
        table.string :doctor_name
        table.string :doctor_email
        table.string :result_token
        table.date :result_date
        table.string :test_type
        table.string :test_limits
        table.string :result
        table.timestamps
      end
    end
    
    TestResults.migrate(:up)
end
