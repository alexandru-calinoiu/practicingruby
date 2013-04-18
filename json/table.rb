require "json"

names, *data = JSON.parse(File.read("#{File.dirname(__FILE__)}/sales.json"))

puts names
p "============"
p data