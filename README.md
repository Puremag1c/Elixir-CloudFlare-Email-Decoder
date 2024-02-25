# Elixir CloudFlare email Decoder

This tool can decode an email address obfuscated by Cloudflare's email protection,
commonly used to protect emails from web scrapers.

To start App:

  * run shell `iex -S mix`
  * try encoded = `543931142127353935313e352e7a373b39`
  * Start app `CFDecoder.go(encoded)`
  * email - `me@usamaejaz.com`