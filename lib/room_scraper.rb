class RoomScraper

  def initialize(index_url)
    @doc = Nokogiri::HTML(open(index_url))
    binding.pry
  end

  def call
    rows.each do |row_doc|
      scrape_row(row_doc)
    end
  end

  private
  def rows
    @rows ||= @doc.search("div.content li.result-row")
  end

  def scrape_row(row)
{
    time => row.search("time"),
    title => row.search("a.hdrlnk").text,
    url => row.search("a.hdrlnk").attribute("href").text,
    price => row.search("span.price").text,
}
  end

end
