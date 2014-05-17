class Crawler
  module Boardlist
    class Mitsuba < Crawler::HTML
      def self.accepting
        ["/menu.html"]
      end

      def parse_tree
        @hash = (@tree/"#menu li a").map do |i|
          i.content.gsub('/', '').split(" - ", 2)
        end
        @hash = Hash[@hash]
      end
    end
  end
end
