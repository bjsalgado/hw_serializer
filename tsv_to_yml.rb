require 'yaml'

data_array = []

File.open(ARGV[0], 'r') do |file|
  header = file.gets.chomp("\n").split("\t")
  while line = file.gets
    data_hash = {}
    line.chomp("\n").split("\t").each.with_index do |student, i|
      data_hash[header[i]] = student
    end
    data_array << data_hash
  end
end

if ARGV[1] == nil
  puts data_array.to_yaml
else
  File.open(ARGV[1], 'w') do |file|
    file.puts data_array.to_yaml
  end
end
