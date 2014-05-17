class Crawler
  module Boardlist
    class Kusaba < Crawler::HTML
      def self.accepting
        ["/menu.html"]
      end

      def parse_tree
        @hash = (@tree/"body > div > ul > li > a.boardlink").map do |i|
          a = i.content.strip
          b = File.basename(i['href'])

          [b, a]
        end
        @hash = Hash[@hash]
      end
    end
  end
end
