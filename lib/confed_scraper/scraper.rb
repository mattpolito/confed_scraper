class ConfedScraper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def process(url)
  end

  def get_content_from(url)
    RestClient.get(url)
  end

  def scrape_message(url)
    p "Scraping: #{url}"
  end
end
