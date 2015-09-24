require 'nokogiri'
require 'open-uri'

#파싱(parsing)할 페이지(예제 : 중앙일보)
PAGE_URL = "http://joongang.joins.com/"

#open-uri 와 nokogiri 를 이용해서 중앙일보 페이지를 파싱
page = Nokogiri::HTML(open(PAGE_URL))
articles = page.css('.main_article .headline a')
articleInfo = []

puts "기사의 갯수를 선택하세요"
pageNumber = gets.chomp

articles.first(pageNumber.to_i).each do |article|
    articleInfo << {title: article.text, link: article['href'].to_s}
end

parsing = []

articleInfo.each do |item|
    doc = Nokogiri::HTML(open(item[:link]))
    text = doc.css('.article_body')
    
    parsing << {title: item[:title], text: text.text}
end

parsing.each do |item|
    puts "**********기사 제목 : #{item[:title]}"
    puts "#{item[:text]}"
    puts ""
end