def CoordinateService
  def glue_coordinates(data)
    raise ArgumentError.new 'Arrays is not comparable' unless data.values.map(&:size).reduce(&:-).zero?
  end

  def calc_distance(data); end

  def calc_total_distance(data); end
end
