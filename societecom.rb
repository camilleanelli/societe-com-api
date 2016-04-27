require 'open-uri'
require 'nokogiri'


def open_url(url)
 Nokogiri::HTML(open(url))
end

def fetch_juridic_table_row(number, document)
  document.css("table#rensjur tr")[number].css('td')[1].text
end

def fetch_siren(document)
  fetch_juridic_table_row(3, document)
end

def fetch_siret(document)
  fetch_juridic_table_row(4, document)
end

def fetch_juridic_form(document)
  fetch_juridic_table_row(7, document)
end
#------- USER
document = open_url("http://www.societe.com/societe/fullsix-france-438769127.html")
puts fetch_siren(document)
puts fetch_siret(document)
puts fetch_juridic_form(document)
