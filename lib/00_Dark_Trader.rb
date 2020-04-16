require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

all_prices =[]
all_symbols = []
page.css("/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div/text()").each{|text| all_symbols << text.content}
page.css("/html/body/div[1]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a/text()").each{|text| all_prices << text.content}

all_prices = all_prices.map{|n| '%0.8f' % n.delete("$").to_f}
my_hash = Hash[all_symbols.zip(all_prices.map)]
$final_result = my_hash.to_a

def my_hash_size
	return $final_result.size
end

def select_element (n)
	return $final_result[n]
end