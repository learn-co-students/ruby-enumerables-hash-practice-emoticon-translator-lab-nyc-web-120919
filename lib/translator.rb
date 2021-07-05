# require modules here
require 'yaml'
require 'pry'

def load_library(ymlpath)
 i = 0 
 emoticons_list = YAML.load_file(ymlpath) 
 emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
 emoticons_list.each do |translation, image|
   #binding.pry 
   #translation is meaning. image is array of eng, and jpn emotes
   emoticons["get_meaning"][image[1]] = translation
   #binding.pry
   emoticons["get_emoticon"][image[0]] = image[1] 
   i += 1 
  end 
#binding.pry 
emoticons 
end 


def get_japanese_emoticon(ymlpath, emoticon)
  list = load_library(ymlpath)
  japanese_emoticon = list["get_emoticon"][emoticon]
  if !japanese_emoticon
    return "Sorry, that emoticon was not found"
  end
  japanese_emoticon
end

def get_english_meaning(ymlpath, emoticon)
  list = load_library(ymlpath)
  meaning = list["get_meaning"][emoticon]
  #binding.pry
  if !meaning
    return "Sorry, that emoticon was not found"
  end   
  meaning 
end