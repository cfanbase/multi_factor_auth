# frozen_string_literal: true
require 'forwardable'
require "multi_factor_auth/methods"

module MultiFactorAuth

  class TOTP
    extend Methods
    extend Forwardable

    delegate [:at, :now, :verify ,:verify_with_drift, :provisioning_uri] => :@instance

    def initialize base32, options = {}
      @instance = ROTP::TOTP.new base32, options
    end
  end
end
