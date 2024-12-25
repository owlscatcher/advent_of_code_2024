# frozen_string_literal: true

# Read and parse data from txt file
module LoadDataService
  def parse_txt(options = {})
    file_path = options.fetch(:file_path, nil)
    separator = options.fetch(:separator, nil)
    sort_values = options.fetch(:sort_values, false)

    raise ArgumentError, 'File not exist or wrong path' if file_path.nil?

    content = File.readlines(file_path)

    raw_data = content.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |line, acc|
      items = separator.nil? ? line.split : line.split(separator)
      items.size.times do |index|
        acc["list_#{index}".to_sym] << items[index].to_i
      end
    end

    sort_values ? raw_data.transform_values(&:sort) : raw_data
  end
end
