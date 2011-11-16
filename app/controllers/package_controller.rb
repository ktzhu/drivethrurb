load 'guardian_content.rb'
load 'timeswire.rb'
require 'open-uri'
require 'nokogiri'

class PackageController < ApplicationController	
	def index
	end
	
	def drive
		begin
			@items = Timeswire::Item.latest('all', 30)
			puts @items.count

			@articles = []
			urls = []

			@items.each do |item|
			  if (item.item_type == "Article" && (item.section == "World" || item.section == "Business Day" || item.section == "Sports" || item.section == "U.S."))
			    @articles << item
				urls << item.url
			  end
			  puts "TITLE: #{item.title}\nItem type is #{item.item_type}\nItem section is #{item.section}\nItem abstract is #{item.abstract}\n\n\n\n."
			end
			puts @articles.count

			# @news_package = []
			
			# urls.each do |url|
				# text = GuardianContent.extract_lede( url )
				# @news_package << text
			# end
			# puts doc.css('html body div#shell div#page.tabContent div#main div.spanAB div#abColumn.abColumn div#article div.columnGroup div.articleBody').text
			
			# @news_package.join("\n")
			
		rescue Exception => e
			puts e.inspect
			puts e.backtrace
		end
	end

	def drive10
		begin
			@items = Timeswire::Item.latest('all', 50)
			@items = @items.select {|i| i.item_type == "Article" && (i.section == "World" || i.section == "Sports" || i.section == "U.S." || i.section == "Business Day")}
			puts @items.inspect
			puts @items.count

			@articles = []
			urls = []

			@items.each do |item|
			  if (item.item_type == "Article" && (item.section == "World" || item.section == "Technology" || item.section == "Opinion"))
			    @articles << item
				urls << item.url
			  end
			end
			puts @articles.count

		rescue Exception => e
			puts e.inspect
			puts e.backtrace
		end
	end
end
