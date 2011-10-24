require 'uri'
require 'cgi'
require 'net/http'
require 'httparty'

class GuardianContent
  include HTTParty
  base_uri 'content.guardianapis.com'
  default_params 'api-key' => 'kbage6rvtjaxwesap4futapr', 'page-size' => '50'
  format :json
 
  def self.sections
    get("/sections")
  end
 
 	def self.find_section(section_title)
    get('/sections', :query => {:q => section_title })
  end
  
  def self.find_by_keyword(search_term)
    response = get(URI.escape("/search?q=#{search_term}"))
	end
	
	def self.keyword_tags
		get('/tags', :query => {:type => 'keyword'})
	end
end