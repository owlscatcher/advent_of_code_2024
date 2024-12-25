# frozen_string_literal: true

# :nodoc:
module CoordinateService
  def glue_coordinates(data)
    raise ArgumentError.new, 'Arrays is not comparable' unless data.values.map(&:size).reduce(&:-).zero?

    keys = data.keys
    data_size = data[keys.first].size

    result = []

    data_size.times do |index|
      result << keys.map { |key| data[key][index] }
    end

    result
  end

  def calc_distance_difference(data)
    data.map { |items| items.reduce(&:-).abs }
  end

  def calc_total_distance(data)
    data.sum
  end
end
