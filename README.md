# MultiFactorAuth

A ruby library for generating one time passwords and QR Codes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multi_factor_auth'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multi_factor_auth

## Usage

### Time based OTP's

```ruby
totp = MultiFactorAuth::TOTP.new("base32secret3232", issuer: "My Service")
totp.now # => "492039"

# OTP verified for current time
totp.verify("492039") # => true
sleep 30
totp.verify("492039") # => false
totp.provisioning_uri("alice@google.com")
```

### Counter based OTP's

```ruby
hotp = MultiFactorAuth::HOTP.new("base32secretkey3232")
hotp.at(0) # => "260182"
hotp.at(1) # => "055283"
hotp.at(1401) # => "316439"

# OTP verified with a counter
hotp.verify("316439", 1401) # => true
hotp.verify("316439", 1402) # => false
```

### Generating a Base32 Secret key

```ruby
MultiFactorAuth::Base32.random_base32  # returns a 16 character base32 secret. Compatible with Google Authenticator
```

### Generating a QR Code

```ruby
totp = MultiFactorAuth::TOTP.new("base32secretkey3232")
qrcode = totp.qr_code("alice@google.com")
image = qrcode.as_png
svg = qrcode.as_svg
html = qrcode.as_html
string = qrcode.as_ansi
string = qrcode.to_s
```
## Resources

* [QR Codes](https://github.com/whomwah/rqrcode)
* [Base32 Library](https://github.com/stesla/base32)
* [The Ruby One Time Password Library](https://github.com/mdp/rotp)

## Contributing

* Fork the project
* Send a pull request

## License

Open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

