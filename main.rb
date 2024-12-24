require './service/load_data_service'

class Main
  include LoadDataService

  DATA_PATH = './tmp/data_day_1.txt'

  attr_accessor :raw_data, :coordinates, :total_distance

  def initialize
    @raw_data = parse_txt(DATA_PATH)
  end
end
