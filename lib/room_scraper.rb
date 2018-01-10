class RoomScraper

  def initialize(index_url)
    @doc = Nokogiri::HTML(open(index_url))
    #binding.pry
  end

  def call
    rows.each do |row_doc|
    room = Room.create_from_hash(scrape_row(row_doc))
    room.save

    end
  end

  private
  def rows
    @rows ||= @doc.search("div.content li.result-row")
  end

  def scrape_row(row)
{
    :date_created => row.search("time.result-date").text,
    :title => row.search("a.hdrlnk").text,
    :url => row.search("a.hdrlnk").attribute("href").text,
    :price => row.search("span.result-price").text,
}
  end

end
