# require modules here
require "yaml"

def load_library
  # code goes here
  emotes = YAML.load_file(path)
  
  result = {
    "get_english_meaning" => {},
    "get_japanese_emoticon" => {}
  }
  
  emotes.each { |key, value|
	  result["get_japanese_emoticon"][value[0]] = emotes[key[1]]
	  result["get_english_meaning"][value[1]] = key
	}
  result
end

def get_japanese_emoticon(path, emotes)
  # code goes here
  result = load_library(path)["get_japanese_emoticon"][emotes]
  if !result
    return "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning
  # code goes here
  result = load_library(path)["get_english_meaning"][emotes]
  if !result
    return "Sorry, that emoticon was not found"
  end
  result
end
