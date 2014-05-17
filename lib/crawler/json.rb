class Crawler
  class JSON < Crawler
    def parse
      @tree = JSON.parse(@content)
    end
  end
end
