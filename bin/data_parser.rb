require 'date'
require 'json'
class DataParser
  attr_accessor :data

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    file = File.read(@file_path)
    @data = JSON.parse(file)
    parsed_data = parse_data
    formatted_output(parsed_data)
  rescue NoMethodError
    print 'The file content is invalid'
  end

  private

  LOW_TIER_ITEMS = [
    'Alchemy Shard',
    'Alteration Shard',
    'Armourer\'s Scrap',
    'Blacksmith\'s Whetstone',
    'Portal Scroll',
    'Scroll of Wisdom',
    'Transmutation Shard',
    'Gemcutter\'s Prism',
    'Glassblower\'s Bauble',
    'Orb of Alteration',
    'Orb of Augmentation',
    'Orb of Chance',
    'Orb of Regret',
    'Orb of Transmutation',
    'Silver Coin',
    'Blessing of Xoph',
    'Splinter of Chayula',
    'Splinter of Esh',
    'Splinter of Tul',
    'Splinter of Uul-Netol',
    'Splinter of Xoph',
  ].freeze

  def parse_data
    output = Hash.new { |hash, key| hash[key] = 0 }
    @data['items'].each do |item|
      output[item['typeLine']] = item['stackSize'] unless LOW_TIER_ITEMS.include?(item['typeLine'])
    end

    output
  end

  def formatted_output(parsed_data)
    date = Date.today.strftime('%d-%m-%y')

    # sorted by custom order to paste on spreadsheet
    %{#{date}\t
      #{parsed_data["Chaos Orb"]}\t
      #{parsed_data["Cartographer's Chisel"]}\t
      #{parsed_data["Orb of Alchemy"]}\t
      #{parsed_data["Orb of Fusing"]}\t
      #{parsed_data["Jeweller's Orb"]}\t
      #{parsed_data["Chromatic Orb"]}\t
      #{parsed_data["Regal Orb"]}\t
      #{parsed_data["Vaal Orb"]}\t
      #{parsed_data["Orb of Scouring"]}\t
      #{parsed_data["Blessed Orb"]}\t
      #{parsed_data["Exalted Orb"]}\t
      #{parsed_data["Orb of Annulment"]}\t
      #{parsed_data["Divine Orb"]}\t
      #{parsed_data["Apprentice Cartographer's Sextant"]}\t
      #{parsed_data["Journeyman Cartographer's Sextant"]}\t
      #{parsed_data["Master Cartographer's Sextant"]}
    }.delete("\n")
  end
end
