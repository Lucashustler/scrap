require 'rubygems'
require 'nokogiri'
require 'open-uri'

def extract_name
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
total_name = []
page.xpath('//a[@class="link-secondary"]').each do |name|
    total_name << name.text
    end
    return total_name
end


def extract_price
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
total_price = []
page.xpath('//a[@class="price"]').each do |price|
    total_price << price.text.delete_prefix("$")
    end
    return total_price
end



def join_my_2_arrays(extract_name, extract_price)
  array_final = []
  extract_price.size.times do |i|
  array_final << {extract_name[i] => extract_price[i]}
  end
  print array_final
  return array_final
end

join_my_2_arrays(extract_name, extract_price)





