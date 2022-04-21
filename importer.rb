require 'pg'

class Importer
  connection = PG.connect(
    host: 'clinickpg',
    dbname: 'clinickdb',
    user: 'clinick',
    password: 'clinick'
  )

  setup_table = %{
      DROP TABLE IF EXISTS result_tests;

      CREATE TABLE result_tests (
        id SERIAL PRIMARY KEY,
        cpf VARCHAR(20),
        name VARCHAR(250),
        email VARCHAR(100),
        birthday DATE,
        street_address TEXT,
        city_address VARCHAR(100),
        state_address VARCHAR(50),
        doctor_crm VARCHAR(50),
        doctor_crm_state VARCHAR(5),
        doctor_name VARCHAR(250),
        doctor_email VARCHAR(100),
        result_token VARCHAR(50),
        result_date DATE,
        test_type VARCHAR(50),
        test_limits VARCHAR(20),
        result VARCHAR(20)
      )
    }

  connection.exec(setup_table)
end