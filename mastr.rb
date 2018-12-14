require 'json'
require 'erb'
require 'nokogiri'

exercise_path = ARGV[0]

if exercise_path.nil?
  raise ArgumentError.new("must provide an exercise path")
end

template = ERB.new(File.read(exercise_path+".xml.erb"))

json_file = File.read(exercise_path+"/seeds.json")
seeds = JSON.parse(json_file).values

seeds.each do |seed|
  # build xml.erb template
  xml_filename = exercise_path+'/'+seed["_seed"].to_s.rjust(3, "0")+".xml"
  xml_str = 
    template.result_with_hash(seed)
  File.write(
    xml_filename, xml_str 
  )
  # convert to HTML snippet 
  html_doc = Nokogiri::XML.parse(xml_str) 
  %w(exercise statement solution answer).each do |tag_name|
    html_doc.css(tag_name).each do |tag| 
      tag.name="div"
      tag['class']=tag_name
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
  html_filename = exercise_path+'/'+seed["_seed"].to_s.rjust(3, "0")+".html"
  File.write(
    html_filename, html_doc.root.to_s
  )
  # convert to LaTeX snippet 
  latex_doc = Nokogiri::XML(xml_str)
  latex_doc.css("p").each do |tag|
    tag.replace "\n"+tag.inner_html+"\n"
  end
  latex_doc.css("m").each do |tag|
    tag.replace '\('+tag.inner_html+'\)'
  end
  latex_doc.css("me").each do |tag|
    tag.replace "\n\\["+tag.inner_html+"\\]\n"
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
  latex_filename = exercise_path+'/'+seed["_seed"].to_s.rjust(3, "0")+".tex"
  File.write(
    latex_filename, latex_doc.at_css("exercise").text
  )
end

