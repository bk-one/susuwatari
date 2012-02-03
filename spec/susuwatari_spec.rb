require 'spec_helper'

describe Susuwatari do
  
  context 'run a simple test' do
    stub_request(:get, "http://www.webpagetest.org/runtest.php?f=json&k=4dabc19c6d0a4c30a2a20b4a6448d085&r=12345&runs=1&url=google.com").
      with(:headers => {'Accept'=>'application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :headers => {}, :body => 
        { "statusCode" => 200,
          "statusText" => "Ok",
          "data" => {
            "testId"     => "120116_KP_2WMG1",
            "ownerKey"   => "d11688c16bd3fee122a9ea300c0e8280c9857a59",
            "jsonUrl"    => "http://www.webpagetest.org/results.php?test=120116_KP_2WMG1&f=json",
            "xmlUrl"     => "http://www.webpagetest.org/xmlResult\/120116_KP_2WMG1/",
            "userUrl"    => "http://www.webpagetest.org/result\/120116_KP_2WMG1/",
            "summaryCSV" => "http://www.webpagetest.org/result\/120116_KP_2WMG1/page_data.csv",
            "detailCSV"  => "http://www.webpagetest.org/result\/120116_KP_2WMG1/requests.csv" } }.to_json)
    mei = Susuwatari.new( url: 'google.com' )
    mei.run
  end
end
