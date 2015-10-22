require 'httparty'

module OpenSecrets

  class Base

    include HTTParty
    base_uri 'http://www.opensecrets.org/api'
    default_params :output => 'xml'
    format :xml

    class Candidate < OpenSecrets::Base

    # Provides summary fundraising information for specified politician.
      def summary(options = {})
        raise ArgumentError, 'You must provide a :cid option' if options[:cid].nil? || options[:cid].empty?
        options.merge!({:method => 'candSummary'})
        self.class.get("/", :query => options)
      end

    # Provides the top organizations contributing to specified politician.
      def contributors(options = {})
        raise ArgumentError, 'You must provide a :cid option' if options[:cid].nil? || options[:cid].empty?
        options.merge!({:method => 'candContrib'})
        self.class.get("/", :query => options)
      end

    # Provides the top industries contributing to a specified politician.
      def industries(options = {})
        raise ArgumentError, 'You must provide a :cid option' if options[:cid].nil? || options[:cid].empty?
        options.merge!({:method => 'candIndustry'})
        self.class.get("/", :query => options)
      end
    end
  end
end