# frozen_string_literal: true

module Rubhttp
  class Client
    def initialize(&block)
      @app = RackBuilder.app(&block)
    end

    # Request a get sans response body.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def head(uri, options = {})
      request :head, uri, options
    end

    # Get a resource.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def get(uri, options = {})
      request :get, uri, options
    end

    # Post to a resource.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def post(uri, options = {})
      request :post, uri, options
    end

    # Put to a resource.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def put(uri, options = {})
      request :put, uri, options
    end

    # Delete a resource.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def delete(uri, options = {})
      request :delete, uri, options
    end

    # Echo the request back to the client.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def trace(uri, options = {})
      request :trace, uri, options
    end

    # Return the methods supported on the given URI.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def options(uri, options = {})
      request :options, uri, options
    end

    # Convert to a transparent TCP/IP tunnel.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def connect(uri, options = {})
      request :connect, uri, options
    end

    # Apply partial modifications to a resource.
    #
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def patch(uri, options = {})
      request :patch, uri, options
    end

    # Make an HTTP request with the given verb.
    #
    # @param verb [String, Symbol]
    # @param uri [String]
    # @param options [Hash]
    # @return [Response]
    def request(verb, uri, options = {})
      r = Request.new(options.merge(verb: verb, uri: uri))
      @app.call(r)
    end
  end
end
