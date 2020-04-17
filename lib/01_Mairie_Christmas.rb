require 'nokogiri'
require 'open-uri'
require 'titleize'

def get_townhall_url
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	$townhall_urls = []
	page.xpath("//p/a/@href").each{|url| $townhall_urls << "http://www.annuaire-des-mairies.com"+url.text[1..-1]}
end

def get_townhall
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	$towns = []
	page.xpath("//p/a/text()").each{|town| $towns << town.content.titleize}
end

def get_townhall_email
	get_townhall_url
	$townhall_emails = []
	$townhall_urls.each do |townhall_url|
		page = Nokogiri::HTML(open(townhall_url))
		page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |email| 
			if email.content == ""
				$townhall_emails << "Pas d'email" 
			else 
				$townhall_emails << email.content
			end
		end
	end
end

def directory (key)
	get_townhall
	get_townhall_email
	$directory = Hash[$towns.zip($townhall_emails.map)]
	return $directory[key]
end

puts $directory
