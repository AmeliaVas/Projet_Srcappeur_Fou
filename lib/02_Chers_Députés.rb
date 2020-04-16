require 'nokogiri'
require 'open-uri'

def get_deputes_url
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	$deputes_url =[]
	page.xpath("/html/body/div/div[3]/div/div/section/div/article/div[3]/div/div[3]/div[1]/ul/li/a/@href").each{|pnom| $deputes_url << "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"+pnom.text}
end

def get_deputes_names
	$deputes = []
end

def get_deputes_email
	get_deputes_url
	$deputes_emails = []
	$deputes_url.each do |depute_url|
		page = Nokogiri::HTML(open(depute_url))
		page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a/text()").each{|email| $deputes_emails << email.content}
	end
end

get_deputes_email
puts $deputes_emails