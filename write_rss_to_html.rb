require 'feedjira'
require 'pry'
require 'httparty'

class WriteRssToHtml
  def initialize(url:)
    @url = url
  end

  def call
    file = File.new("#{feed.title}.html", "w+")
    file.puts("<HTML>\n<HEAD></HEAD><BODY>")
    write_rss_to(html: file)
    file.puts("</BODY></HTML>")
    file.close
    "#{feed.title}.html"
  end

  private

  attr_reader :url

  def feed
    @feed ||= begin
      xml = HTTParty.get(url).body
      Feedjira::Feed.parse(xml)
    end
  end

  def write_rss_to(html:)
    feed.entries.each do |item|
      html.puts(item.title)
      html.puts(item.summary)
    end
  end
end

