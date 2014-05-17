class Crawler
  module Boardlist
    class FourchanApi < Crawler::JSON
      def self.accepting
        ["/boards.json"]
      end

      def parse_tree
        @hash = @tree["boards"].map { |i| [i["board"], i["title"]] }
        @hash = Hash[@hash]
      end
    end
  end
end
