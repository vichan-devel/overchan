class Crawler
  attr_writer :content

  def to_h
    raise "Content not loaded" if not @content
    parse unless @tree
    parse_tree unless @hash

    @hash
  end

  def self.available_parsers(sort)
    Dir["lib/crawler/#{sort}/*.rb"]
      .map { |i| File.basename(i, ".rb") }
      .map { |i| i.classify }
      .map { |i| "Crawler::" << sort.classify << "::" << i }
      .map { |i| i.constantize }
  end

  module Boardlist
    Dir["lib/crawler/boardlist/*.rb"].each do |i|
      autoload File.basename(i, ".rb").classify.to_sym, i.sub(/.rb$/, '').sub(/^lib\//, '')
    end
  end

  module Posts
    Dir["lib/crawler/posts/*.rb"].each do |i|
      autoload File.basename(i, ".rb").classify.to_sym, i.sub(/.rb$/, '').sub(/^lib\//, '')
    end
  end

  Dir["lib/crawler/*.rb"].each do |i|
    autoload File.basename(i, ".rb").classify.to_sym, i.sub(/.rb$/, '').sub(/^lib\//, '')
  end
end
