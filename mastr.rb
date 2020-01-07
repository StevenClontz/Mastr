require 'json'
require 'erb'
require 'nokogiri'

if ARGV[0].nil?
  raise ArgumentError.new("must provide an exercise path")
else
  exercise_path = ARGV[0]
  exercise_name = exercise_path.split("/")[-1]
end

if ARGV[1].nil?
  build_path = "build/"+exercise_path
else
  build_path = ARGV[1]
  unless build_path[-1] == '/'
    build_path = build_path + '/'
  end
  build_path = build_path+exercise_name
end

template = ERB.new(File.read(exercise_path+".xml.erb"))

json_file = File.read(build_path+"/seeds.json")
seeds = JSON.parse(json_file)

seeds["seeds"].each do |seed|
  # put title on seed
  seed["_title"]=seeds["title"]
  # build xml.erb template
  xml_filename = build_path+'/'+seed["_seed"].to_s.rjust(3, "0")+".xml"
  xml_str = 
    template.result_with_hash(seed)
  xml_str.gsub! '&', '&amp;'
  File.write(
    xml_filename, xml_str 
  )
  # convert to HTML snippet 
  html_doc = Nokogiri::XML.parse(xml_str) 
  %w(exercise statement solution answer).each do |tag_name|
    html_doc.css(tag_name).each do |tag| 
      tag.name="div"
      tag['class']=tag_name
      if tag_name == 'answer'
        tag.children.before("<h4>Answer.</h4>")
      end
    end 
  end
  html_doc.css("title").each do |tag|
    tag.name = "h2"
    tag['class']="title"
  end
  html_doc.css("me").each do |tag|
    tag.name = "p"
    tag['class']="me"
    tag.content = '\['+tag.content+'\]'
  end
  html_doc.css("m").each do |tag|
    tag.name = "span"
    tag['class']="m"
    tag.content = '\('+tag.content+'\)'
  end
  #Handle md for multiline math
  html_doc.css("md").each do |tag|
  	tag.replace "\n\\begin{align*}\n" + tag.inner_html+"\\end{align*}\n"
  end
  #Handle mrow for multiline math
  html_doc.css("mrow").each do |tag|
  	tag.replace tag.inner_html+"\\\\ \n"
  end
  html_filename = build_path+'/'+seed["_seed"].to_s.rjust(3, "0")+".html"
  File.write(
    html_filename, html_doc.root.to_s
  )
  # convert to LaTeX snippet 
  latex_doc = Nokogiri::XML(xml_str)
  latex_doc.css("p").each do |tag|
    tag.replace tag.inner_html+"\n\n"
  end
  latex_doc.css("m").each do |tag|
    tag.replace '\('+tag.inner_html+'\)'
  end
  latex_doc.css("me").each do |tag|
    tag.replace "\n\\["+tag.inner_html+"\\]\n"
  end
  #Handle md for multiline math
  latex_doc.css("md").each do |tag|
  	tag.replace "\n\\begin{align*}\n" + tag.inner_html+"\\end{align*}\n"
  end
  #Handle mrow for multiline math
  latex_doc.css("mrow").each do |tag|
  	tag.replace tag.inner_html+"\\\\ \n"
  end
  %w(Statement Answer Title Solution).each do |tag_name|
    latex_doc.css(tag_name.downcase).each do |tag|
      tag.replace "\\begin{exercise#{tag_name}}"+
        tag.inner_html+
        "\\end{exercise#{tag_name}}"
    end
  end
  latex_doc.at_css("exercise").content =
    '\begin{exercise}'+
    latex_doc.at_css("exercise").content+
    '\end{exercise}'
  latex_filename = build_path+'/'+seed["_seed"].to_s.rjust(3, "0")+".tex"
  File.write(
    latex_filename, latex_doc.at_css("exercise").text
  )
end

