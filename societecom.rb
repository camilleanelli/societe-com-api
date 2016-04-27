require 'open-uri'
require 'nokogiri'


def open_url(url)
  Nokogiri::HTML(open(url))
end

def fetch_juridic_table_row(number, url)
  document = open_url(url)
  document.css("table#rensjur tr")[number].css('td')[1].text
end

def fetch_siren(url)
  fetch_juridic_table_row( 3, url)
end

def fetch_siret(url)
  fetch_juridic_table_row(4, url)
end

puts fetch_siren("http://www.societe.com/societe/fullsix-france-438769127.html")
puts fetch_siret("http://www.societe.com/societe/fullsix-france-438769127.html")
