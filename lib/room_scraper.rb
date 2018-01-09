class RoomScraper

  def initialize(index_url)
    @doc = Nokogiri::HTML(open(atl_scraper))
  end
end
