require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def scraper 
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    array_body = page.xpath("//tbody/tr") # on selectionne la partie du bloc contenant les informations a extraire
    
    array_crypto_values = []
    rank = 1

    array_body.each do |name|
        symbol = name.xpath("//tbody/tr[#{rank}]/td[2]/div").text
        value = name.xpath("//tbody/tr{#{rank}]/td[5]/a").text
            rank +=1
    result = Hash.new
        result[symbol] = value
        array_crypto_values.push(result)
    end
    return array_crypto_values  
end

scraper