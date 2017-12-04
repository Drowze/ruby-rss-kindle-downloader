require 'pry'
require 'dotenv'
require './kindle_mailer'
require './write_rss_to_html'
require './ebook_converter'

Dotenv.load

urls = ['http://www.ruby-lang.org/en/feeds/news.rss']

files = urls.map do |url|
  html_filename = WriteRssToHtml.new(url: url).call
  file_basename = File.basename(html_filename, '.html')
  EbookConverter.convert(html_filename, "#{file_basename}.mobi")
end

KindleMailer.new(kindle_address: ENV['KINDLE_ADDRESS']).send_mail(files: files)

