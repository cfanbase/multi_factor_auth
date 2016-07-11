# frozen_string_literal: true
require 'rotp'
require 'rqrcode'
require 'base32'
require 'securerandom'

module MultiFactorAuth

  module Methods

    def self.extended base
      base.class_eval do
        def qr_code email, opts = {}
          self.singleton_class.generate_qr_code provisioning_uri(email), opts
        end
      end
    end

    def generate_secret str_or_arr = nil
      case str_or_arr
      when Array
        Base32.encode Digest::MD5.hexdigest("#{str_or_arr.join(SecureRandom.uuid)}")
      when String
        Base32.encode Digest::MD5.hexdigest(str_or_arr)
      else
        random_base32
      end
    end

    def random_base32
      ROTP::Base32.random_base32
    end

    def generate_qr_code link, opts = {}
      RQRCode::QRCode.new(link, {level: :h}.merge(opts))
    end

  end
end
