# require modules here
require "yaml"

def load_library(file_name)
  lib = YAML.load_file(file_name)
  new_hash = {:get_meaning => {},:get_emoticon => {}}
  lib.map do |k,v|
    new_hash[:get_meaning][v[1]] = k
    new_hash[:get_emoticon][v[0]] = v[1]
  end
  return new_hash
end

def get_japanese_emoticon(file_name, emoti)
  new_hash = load_library(file_name)
  if new_hash[:get_emoticon][emoti]
    return new_hash[:get_emoticon][emoti]
  else return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_name, emoti)
  new_hash = load_library(file_name)
  if new_hash[:get_meaning][emoti]
    return new_hash[:get_meaning][emoti]
  else return "Sorry, that emoticon was not found"
  end
end