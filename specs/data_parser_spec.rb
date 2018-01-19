require_relative '../bin/data_parser'
require 'minitest/autorun'

describe DataParser do
  describe 'valid file' do
    data_parser = DataParser.new(Dir.pwd + '/specs/support/valid_file.json')
    output = data_parser.call
    valid_output = "19-01-18\t    681\t    14\t    67\t    206\t   662\t    278\t    10\t    37\t     64\t     43\t     2\t   4\t    5\t    7\t    1\t    10"

    it { output.must_equal(valid_output) }
    end
  end
end
