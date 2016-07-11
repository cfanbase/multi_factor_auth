# frozen_string_literal: true
require 'forwardable'
require "multi_factor_auth/methods"

module MultiFactorAuth

  class HOTP
    extend Methods
    extend Forwardable

    delegate [:at, :verify, :verify_with_retries, :provisioning_uri] => :@instance

    def initialize base32, options = {}
      @instance = ROTP::HOTP.new base32, options
    end
  end
end
