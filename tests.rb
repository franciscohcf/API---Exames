require 'test/unit'
require 'csv'
require './converter.rb'

class ConverterTest < Test::Unit::TestCase
  def test_converter
    data = CSV.read('result_tests.csv', col_sep: ';')

    result = Converter.convert(data)

    selected = result.find { |row| row['cpf'] == '086.183.708-86' }

    assert_equal "Vitor Hugo Madeira Filho", selected['name']
  end
end