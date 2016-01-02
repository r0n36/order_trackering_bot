module Crawl
  module Flipkart
    class ProductData
      attr_accessor :url
      def initialize(query=nil)
        @url = query
      end

      def crawl_data
        @crawl_data ||= Cobweb.new(:follow_redirects => false).get(url)
      end
    end
  end
end
