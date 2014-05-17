module Fetcher
  def self.get a, &block
    req = EM::HttpRequest.new(a)

    if block
      req = req.aget
      req.errback { block.(false) }
      req.callback { block.(req.response) }
    else
      req = req.get
      if req.error.nil?
        req.response
      else
        false
      end
    end
  end
end
