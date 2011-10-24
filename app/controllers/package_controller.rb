load 'guardian_content.rb'
require 'open-uri'
require 'nokogiri'

class PackageController < ApplicationController	
	def index
		puts @articles.inspect
		
		@benghazi = GuardianContent.extract_text('http://www.guardian.co.uk/world/2011/oct/23/benghazi-joy-end-libya-tyranny')
		gaddafi = GuardianContent.find_by_keyword('gaddafi')
		@gaddafitest = GuardianContent.titles(gaddafi)
	end
	
	def drive
		begin
			world_news = GuardianContent.find_by_section( "world" )
			article_urls = GuardianContent.urls( world_news )
			puts article_urls.inspect
			@world_titles = GuardianContent.titles( world_news )
			
			sports_news = GuardianContent.find_by_section("sport")
			sports_urls = GuardianContent.urls( sports_news )
			@sports_titles = GuardianContent.titles( sports_news )
			
			business_news = GuardianContent.find_by_section("business")
			business_urls = GuardianContent.urls( business_news )
			@business_titles = GuardianContent.titles( business_news )
			
			@news_package = []
			
			article_urls.each do |url|
				article_text = GuardianContent.extract_text( url )
				@news_package << GuardianContent.truncated_text( article_text )
				puts @news_package.inspect
			end
						
			sports_urls.each do |url|
				text = GuardianContent.extract_text( url )
				@news_package << GuardianContent.truncated_text( text )
			end
			
			business_urls.each do |url|
				text = GuardianContent.extract_text( url )
				@news_package << GuardianContent.truncated_text( text )
			end
			
			@news_package.join("\n")
			
		rescue Exception => e
			puts e.inspect
			puts e.backtrace
		end
	end
end