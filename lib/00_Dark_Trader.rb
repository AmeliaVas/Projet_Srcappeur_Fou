require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

all_prices =[]
all_symbols = []
page.css("/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div/text()").each{|text| all_symbols << text.content}
page.css("/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a/text()").each{|text| all_prices << text.content}

all_prices = all_prices.map{|n| '%0.8f' % n.delete("$").to_f}
$my_hash = Hash[all_symbols.zip(all_prices.map)]

def my_hash_size
	return $my_hash.size
end

def select_element (n)
	return $my_hash[n]
end