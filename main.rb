# frozen_string_literal: true

require './service/load_data_service'
require './service/coordinate_service'

# Entry point
class Main
  include LoadDataService
  include CoordinateService

  attr_accessor :coordinates, :glued_data, :distance_difference_data, :total_distance

  def load_data(options = {})
    file_path = options.fetch(:file_path, nil)
    sort_values =  options.fetch(:sort_values, false)

    @coordinates = parse_txt file_path: file_path, sort_values: sort_values
    @glued_data = glue_coordinates(@coordinates)
    @distance_difference_data = calc_distance_difference(@glued_data)
    @total_distance = calc_total_distance(@distance_difference_data)

    puts  "Successfull load data:\n\t" \
          "- From division :\t#{@coordinates.keys.count}\n\t" \
          "- Total distance:\t#{@total_distance}"
  end
end
