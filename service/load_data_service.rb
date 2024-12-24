module LoadDataService
  def parse_txt(path, separator = nil)
    content = File.readlines(path)

    content.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |line, acc|
      items = separator.nil? ? line.split : line.split(separator)
      items.size.times do |index|
        acc["list_#{index}".to_sym] << items[index]
      end
    end
  end
end
