class MainController < ApplicationController

  def index
    # http://auburn.craigslist.org/search/sof?zoomToPosting=&query=ruby&srchType=A&addTwo=contract&addOne=telecommute&addFour=part-time

    # TODO:
    # (1) get the url above and put contents to response
    # (2) parse the response and output the links found
    # (2.5) format and include any indicental info (i.e. locality, date of post, etc)
    # (3) get a few diff CL localities and output same
    # (4) get for all CL localities
    # (5) allow user to change the query (set up a form)

    require 'net/http'
    uri = URI('http://nyc.craigslist.org/search/sof?zoomToPosting=&query=ruby&srchType=A&addTwo=contract')
    page_html = Net::HTTP.get(uri)
    doc = Nokogiri::HTML(page_html)
    @output = ''
    doc.css("p[@class='row']").each do |row|
      date = row.css("span[@class='date']").text
      text = ''
      path = ''
      row.css('a').each do |link|
        text = link.text if !link.text.empty?
        path = link.attributes['href'].value
      end
      @output += "<p>#{date} -- #{text} -- #{path}<\p>"
    end
  end

end
