load 'guardian_content.rb'

class Package < ActiveRecord::Base
	attr_accessor :length, :articles
	
	def initialize( minutes="2" )
		@length = minutes
		@articles = []
	end
	
	def reading_time( text )
		word_count = "#{text}".split(/\S+/).size
		wpm = 250
		@read_time = word_count / wpm
		@read_time
	end
	
	def self.add_article( article_url )
		world_news = GuardianContent.find_by_section( "world" )
		article_urls = GuardianContent.urls( world_news )
		article_urls.each do |url|
			@articles << GuardianContent.extract_text( url )
		end
		@articles
	end
end