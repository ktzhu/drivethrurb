require 'uri'
require 'cgi'
require 'net/http'
require 'httparty'
require 'open-uri'
require 'nokogiri'

class GuardianContent
  include HTTParty
  base_uri 'content.guardianapis.com'
  default_params 'api-key' => 'kbage6rvtjaxwesap4futapr', 'page-size' => '1'
  format :json
 
  def self.sections
    get("/sections")
  end
 
 	def self.find_section( section_title )
    get('/sections', :query => {:q => section_title })
  end
  
  def self.find_by_keyword( search_term )
    query = get(URI.escape("/search?q=#{search_term}"))
    if query.parsed_response["response"]["status"] == "ok"
    	return query.parsed_response["response"]["results"]
    end
	end
	
	def self.find_by_section( section_title )
    query = get(URI.escape("/search?section=#{section_title}"))
    if query.parsed_response["response"]["status"] == "ok"
    	return query.parsed_response["response"]["results"]
    end
	end
	
	def self.titles( article_array )
		titles = []
		article_array.each do |article|
			titles << article["webTitle"]
		end
		titles
	end
	
	def self.urls( article_array )
		urls = []
		article_array.each do |article|
			urls << article["webUrl"]
		end
		urls
	end
	
	def self.extract_text( article_url )
		doc = Nokogiri::HTML(open("#{article_url}"))
		return doc.at_css("#article-body-blocks").text
# 		doc.css("#article-body-blocks").each do |node|
# 			puts node.text
# 		end
	end
	
	def self.truncated_text(max_length=300, text)
    original_text = text
    counter = 0

    if original_text.length >= max_length
      max_length.downto(0) { |i|
        counter += 1
        return original_text[0..(max_length - counter)] << "..." if original_text[i] == " "
        }
    else
      original_text
    end    
  end
	
	def self.keyword_tags
		get('/tags', :query => {:type => 'keyword'})
	end
	
	def self.reading_time( text )
		word_count = "#{text}".split(/\S+/).size
		wpm = 250
		read_time = word_count / wpm
		read_time
	end
	
	def self.add_article( article_url )
		articles = []
		articles << GuardianContent.extract_text( article_url )
	end
end