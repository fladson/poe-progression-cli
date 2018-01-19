require_relative 'data_parser'
file_path = ARGV.shift
print DataParser.new(file_path).call if file_path
