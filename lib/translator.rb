# require modules here
require "yaml"

{"angel"=>["O:)", "☜(⌒▽⌒)☞"],
 "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
 "bored"=>[":O", "(ΘεΘ;)"],
 "confused"=>["%)", "(゜.゜)"],
 "embarrased"=>[":$", "(#^.^#)"],
 "fish"=>["><>", ">゜))))彡"],
 "glasses"=>["8D", "(^0_0^)"],
 "grinning"=>["=D", "(￣ー￣)"],
 "happy"=>[":)", "(＾ｖ＾)"],
 "kiss"=>[":*", "(*^3^)/~☆"],
 "sad"=>[":'(", "(Ｔ▽Ｔ)"],
 "surprised"=>[":o", "o_O"],
 "wink"=>[";)", "(^_-)"]}

def load_library(emoticon_file)
  # code goes here	 
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticon_libray = {"get_meaning"  => {},
                     "get_emoticon" => {}}

  emoticons.each do |meaning, values|  
    # meaning="angel" 
    #values= ["O:)", "☜(⌒▽⌒)☞"]  
    english = values[0]
    japanese = values[1]
    emoticon_libray["get_meaning"][japanese] = meaning
    emoticon_libray["get_emoticon"][english] = japanese
  end
 emoticon_libray
end

{"get_meaning"=>
  {"☜(⌒▽⌒)☞"=>"angel",
   "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
   "(ΘεΘ;)"=>"bored",
   "(゜.゜)"=>"confused",
   "(#^.^#)"=>"embarrased",
   ">゜))))彡"=>"fish",
   "(^0_0^)"=>"glasses",
   "(￣ー￣)"=>"grinning",
   "(＾ｖ＾)"=>"happy",
   "(*^3^)/~☆"=>"kiss",
   "(Ｔ▽Ｔ)"=>"sad",
   "o_O"=>"surprised",
   "(^_-)"=>"wink"},
 "get_emoticon"=>
  {"O:)"=>"☜(⌒▽⌒)☞",
   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
   ":O"=>"(ΘεΘ;)",
   "%)"=>"(゜.゜)",
   ":$"=>"(#^.^#)",
   "><>"=>">゜))))彡",
   "8D"=>"(^0_0^)",
   "=D"=>"(￣ー￣)",
   ":)"=>"(＾ｖ＾)",
   ":*"=>"(*^3^)/~☆",
   ":'("=>"(Ｔ▽Ｔ)",
   ":o"=>"o_O",
   ";)"=>"(^_-)"}}

def get_japanese_emoticon(emoticon_file, eng_emoticon)
  hash = load_library(emoticon_file)
  if hash["get_emoticon"][eng_emoticon] == nil
    return "Sorry, that emoticon was not found"
  else return hash["get_emoticon"][eng_emoticon]
  end
end


def get_english_meaning(emoticon_file, jap_emoticon)
  hash = load_library(emoticon_file)
  if hash["get_meaning"][jap_emoticon] == nil
    return "Sorry, that emoticon was not found"
  else return hash["get_meaning"][jap_emoticon]
  end
end