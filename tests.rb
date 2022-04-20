require 'test/unit'
require './converter.rb'

class ConverterTest < Test::Unit::TestCase
  def test_converter
    result = Converter.convert('result_tests.csv')

    selected = result.find { |row| row['cpf'] == '086.183.708-86' }

    assert_equal "Vitor Hugo Madeira Filho", selected['name']
  end
end