require 'nokogiri'
require 'open-uri'

def get_deputes_url
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	$deputes_url =[]
	page.xpath("/html/body/div/div[3]/div/div/section/div/article/div[3]/div/div[3]/div/ul/li/a/@href").each{|pnom| $deputes_url << "http://www2.assemblee-nationale.fr"+pnom.text}
end

def get_deputes
	get_deputes_url
	$deputes_emails = []
	$deputes_names = []
	$deputes_url.each do |depute_url|
		page = Nokogiri::HTML(open(depute_url))
		page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a/text()").each do |email| 
			if email.content == ""
				$deputes_emails << "Pas d'email" 
			else 
				$deputes_emails << email.content
			end
		end
		page.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1").each{|dname| $deputes_names << dname.content}
	end
end

def directory(key)
	get_deputes
	puts $directory = Hash[$deputes_names.zip($deputes_emails.map)]
	return $directory[key]
end
