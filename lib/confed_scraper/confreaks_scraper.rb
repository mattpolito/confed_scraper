class ConfedScraper::ConfreaksScraper < ConfedScraper::Scraper
  SITE_URI = "http://confreaks.net"

  def process
    content = get_content_from(url)
    videos_doc= Nokogiri::HTML.parse(content)
    links = videos_doc.xpath('//*[@class="video"]//*[@class="title"]/a')
    video_data = []
    links.each_with_index do |link|
      vid = {}
      show_page_url = SITE_URI + link.attr('href')
      show_page_content = RestClient.get(show_page_url)
      show_page_doc = Nokogiri::HTML.parse(show_page_content)

      scrape_message(show_page_url)

      title = show_page_doc.xpath('//*[@class="video-title"]').text.strip
      vid[:title] = title
      vid[:uri] = show_page_url
      vid[:presenters] = show_page_doc.xpath('//*[@class="video-presenters"]/a').map(&:text)
      vid[:description] = show_page_doc.xpath('//*[@class="video-abstract"]/p').text.strip
      video_data << vid
    end

    video_data
  end
end
