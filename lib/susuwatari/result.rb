require 'rest_client'
require 'rexml/document'

class Susuwatari
  class Result
    include REXML
    STATUS_URL        = 'http://www.webpagetest.org/testStatus.php'
    RESULT_URL_PREFIX = 'http://www.webpagetest.org/xmlResult/'

    attr_reader :test_id, :current_status
    
    def initialize( test_run_response )
      @test_id = Document.new(test_run_response).root.elements['*/testId'].text
    end
    
    def status
      unless current_status == :complete
        fetch_status
      end
      current_status
    end
    
    private
        
    def fetch_status
      @response = RestClient.get STATUS_URL, :params => { :f => :xml, :test => test_id }
      case Document.new(@response).root.elements['*/statusCode'].text
        when /1../
          @current_status = :running
        when "200"
          @current_status = :complete
          fetch_result
        else
          @current_status = :error
      end
    end
    
    def fetch_result
      
    end
    
    class Average
      attr_reader :load_time, :ttfb, :bytes_in, :bytes_in_doc, :requests, :requests_doc, :render, :fullyLoaded, :doc_time, :dom_time, :title_time
      
      def initialize( xml_fragment )
      end

    end
  end
end
