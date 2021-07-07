require "yaml"


def load_library(file_path)
 emoticons = YAML.load_file(file_path)
 
 result_hash = {
 'get_meaning' => {},
 'get_emoticon' => {}
 }
 
 emoticons.each do |key, value| 
   result_hash['get_emoticon'][value[0]] = emoticons[key][1]
   result_hash['get_meaning'][value[1]] = key 
 end
 
 result_hash
end

def get_japanese_emoticon(file_path, emoticon)
  translation = load_library(file_path)["get_emoticon"][emoticon]
  translation ? translation : "Sorry, that emoticon was not found" 
end

def get_english_meaning(file_path, emoticon)
  translation = load_library(file_path)["get_meaning"][emoticon]
  translation ? translation : "Sorry, that emoticon was not found" 
end