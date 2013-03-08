module StubhubHelper

  module Client
    include HTTParty
    @base_uri = "http://www.stubhub.com/listingCatalog/select/?q="
    # format :json

    def self.convert_query_to_url(options)
      options.map do |k, v|
        "%2B+#{k}%3A#{v}%0D%0A"
      end.join << '&start=0&rows=100&wt=json'
    end

    def self.make_request(klass, options)
      query_url = @base_uri + convert_query_to_url(options)
      result = get(query_url)
      parsed_result = JSON.parse(result.body)
      # parsed_result["response"]["docs"].map do |doc|
      #   klass.new(doc)
      # end
    end

  end

  class Document < OpenStruct

    def initialize(data = {})
      raise ArgumentError, "Invalid data passed to Document.new: #{data.inspect}" unless data.is_a?(Hash)
      super(data)
    end

    def self.demodulize(class_name_in_module)
      class_name_in_module.to_s.gsub(/^.*::/, '')
    end

    def fields
      @table.keys.map { |k| k.to_s }
    end

  end

  class Genre < Document

    def self.search(search_query)
      search_query = URI.escape(search_query)
      options = { "stubhubDocumentType" => "#{demodulize(self).downcase}",
                  "description" => "#{search_query}"}
      Client.make_request(Event, options)
    end

  end

  class Event < Document 

    def self.find_by_event_id(event_id)
      options = { "stubhubDocumentType" => "#{demodulize(self).downcase}",
                  "event_id" => "#{event_id}"}
      Client.make_request(Event, options)
    end

    def self.search(search_query) 
      search_query = URI.escape(search_query)
      options = { "stubhubDocumentType" => "#{demodulize(self).downcase}",
                  "description" => "#{search_query}"}
      result = Client.make_request(Event, options)
    end
  end

  class Ticket < Document 

    def self.find_by_ticket_id(ticket_id)
      options = { "stubhubDocumentType" => "#{demodulize(self).downcase}",
                  "id" => "#{ticket_id}"}
      Client.make_request(Ticket, options)
    end

    def self.find_by_event_id(event_id)
      options = { "stubhubDocumentType" => "#{demodulize(self).downcase}",
                  "event_id" => "#{event_id}"}
      Client.make_request(Ticket, options)
    end

  end

end
