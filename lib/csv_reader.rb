require 'csv'
module CSVReader
  def read_csv(file_name)
    file = File.join(Rails.root, 'etc', file_name)
    CSV.read(file)
  end
end
