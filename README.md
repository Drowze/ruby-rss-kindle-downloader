# Ruby RSS Kindle downloader (WIP)

## What is working?

As of now, downloading hard-coded RSS feeds is supported. The formatting however may be not pretty.

## This project has a cool name. What is on the plans?

Glad you liked it. The plan is to have it working on a Sinatra webserver serving RSS news to kindle devices automatically from time to time. Only known external dependency should be ebook-convert, which is available with calibre.  
For using ebook-convert on Heroku, [this build pack](https://github.com/raff0z/calibre-heroku-buildpack) should do the trick

