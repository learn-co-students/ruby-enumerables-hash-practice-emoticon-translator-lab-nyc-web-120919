require 'yaml'

def load_library(file_path)
  hash = {:get_meaning => {}, :get_emoticon => {}}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |meanings, array|
  hash[:get_meaning]["#{array[1]}"] = "#{meanings}"
  hash[:get_emoticon]["#{array[0]}"] = "#{array[1]}"
end
  hash 
end

def get_japanese_emoticon(file_path, emoticon)
  if load_library(file_path)[:get_emoticon][emoticon]
    return load_library(file_path)[:get_emoticon][emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file_path, emoticon)
  if load_library(file_path)[:get_meaning][emoticon]
    return load_library(file_path)[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end 
end