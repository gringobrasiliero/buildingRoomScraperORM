require_relative './config/environment'

def reload!
  load_all ./lib
end

task :console do
  Pry.start
  end

  task :scrape_rooms do
    atl_scraper = RoomScraper.new("https://atlanta.craigslist.org/search/roo")
  #  atl_scraper.call

      end
