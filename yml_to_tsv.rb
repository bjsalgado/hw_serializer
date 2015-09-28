require 'yaml'

data_yaml = YAML::load(File.read(ARGV[0]))
arr_data = []
data_yaml.each.with_index do |data, i|
  if i == 0
    arr_data <<  data_yaml[i].keys.join("\t")+"\n"
    arr_data << data.values.join("\t") + "\n"
  else
    arr_data << data.values.join("\t") + "\n"
  end
end

if ARGV[1] == nil
  puts arr_data
else
  File.open(ARGV[1], 'w') do |file|
    file.puts arr_data
  end
end
