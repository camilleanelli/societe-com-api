require 'open-uri'
require 'nokogiri'

def fetch_siren(url)
  doc = Nokogiri::HTML(open(url))
  doc.css("table#rensjur tr")[3].css('td')[1].text
end

puts fetch_siren("http://www.societe.com/societe/fullsix-france-438769127.html")
