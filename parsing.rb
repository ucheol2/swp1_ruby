require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://joongang.joins.com/"

page = Nokogiri::HTML(open(PAGE_URL))
articles = page.css('.main_article .headline a')
articleInfo = []

puts "기사의 갯수를 선택하세요"
pageNumber = gets.chomp

unless !/\A\d+\z/.match(pageNumber)
    articles.first(pageNumber.to_i).each do |article|
        articleInfo << {title: article.text, link: article['href'].to_s}
    end
    
    parsing = []
    
    articleInfo.each do |item|
        doc = Nokogiri::HTML(open(item[:link]))
        text = doc.css('.article_body')
        
        parsing << {title: item[:title], text: text.text}
    end
    
    parsing.each_with_index do |item, index|
        puts "**********기사#{index+1} / 제목 : #{item[:title]}"
        puts "**********본문#{item[:text]}"
    end
else
    puts "숫자가 아닙니다"
end