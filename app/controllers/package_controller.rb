load 'guardian_content.rb'
require 'json'

class PackageController < ApplicationController
	def index
		puts GuardianContent.sections
		puts GuardianContent.find_section("technology")
		puts GuardianContent.find_by_keyword("gaddafi")
		parsedis = GuardianContent.find_by_keyword("gaddafi").body
		puts GuardianContent.keyword_tags
# 		puts Crack::JSON.parse(parsedis.body)
		parsed = JSON.parse(parsedis)
		puts parsed["response"]
	end
end