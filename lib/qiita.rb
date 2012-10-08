require "qiita/client"
require "qiita/version"

module Qiita
  class << self
    def new options={}
      Qiita::Client.new options
    end

    # Delegate to Qiita::Client.new
    def method_missing(method, *args, &block)
      return super unless respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to_missing?(method, include_private = false)
      Qiita::Client.public_method_defined?(method)
    end
  end
end

