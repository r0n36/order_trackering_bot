module Crawl
  module Flipkart
    class ProductData
      attr_accessor :url
      def initialize(query=nil)
        @url = query
      end

      def product_data
        {
            name: 'crawl_data',
            weight: 122,
            base_price: 12000,
            img_url: 'crawl_data',
            seller_name: 'crawl_data',
            url: url
        }
      end

      def crawl_data
        @crawl_data ||= Cobweb.new(:follow_redirects => false).get(url)
      end
    end
  end
end
