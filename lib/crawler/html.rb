class Crawler
  class HTML < Crawler
    def parse
      @tree = Nokogiri::HTML(@content)
    end
  end
end
