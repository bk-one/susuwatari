require "susuwatari/version"
require 'susuwatari/result'
require 'rest_client'
require 'forwardable'

class Susuwatari
  extend Forwardable

  attr_accessor :url, :api_key, :response
  
  def_delegator :@result, :status
  
  TEST_URL = 'http://www.webpagetest.org/runtest.php'

  def initialize( options = {} )
    options.each do |key, value|
      self.send("#{key}=".to_sym, value)
    end
  end

  def run
    @result = Result.new(RestClient.get TEST_URL, :params => { :url => url, :f => :xml, :k => 'xxxxxxxx', :r => '12345', :runs => 1 }, :accept => :xml)
  end
end
