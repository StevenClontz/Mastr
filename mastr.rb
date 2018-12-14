require 'json'
require 'erb'
require 'nokogiri'

exercise_path = ARGV[0]

if exercise_path.nil?
  raise ArgumentError.new("must provide an exercise path")
end

template = ERB.new(File.read(exercise_path+".xml.erb"))

Dir.glob(exercise_path+'/*.json') do |json_filename|
  json_file = File.read(json_filename)
  xml_filename = json_filename[0..-6]+".xml"
  xml_str = 
    template.result_with_hash(JSON.parse json_file)
  File.write(
    xml_filename, xml_str 
  )
  xml_doc = Nokogiri::XML(xml_str)
  html_doc = xml_doc
  html_doc.css("exercise").each{|tag| tag.name="div"} 
  html_doc.css("solution").each{|tag| tag.name="div"} 
  html_doc.css("me").each do |tag|
    tag.name = "p"
    tag.content = '\['+tag.content+'\]'
  end
  html_doc.css("m").each do |tag|
    tag.name = "span"
    tag.content = '\('+tag.content+'\)'
  end
  html_filename = json_filename[0..-6]+".html"
  File.write(
    html_filename, html_doc.root.to_s
  )
end

