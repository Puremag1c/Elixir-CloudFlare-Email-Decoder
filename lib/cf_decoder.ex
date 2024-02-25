defmodule CFDecoder do
  @moduledoc """
    Documentation for `CFDecoder`.

    Cloudflare Email Decoder
    This tool can decode an email address obfuscated by Cloudflare's email protection,
    commonly used to protect emails from web scrapers.

    Just run CFDecoder.go/1 with the encoded string, found inside the data-cfemail="" tag to view the decoded email.
  """

  @doc """
    decode CloudFlare encoded email string

    ## Examples

      iex> CFDecoder.go("543931142127353935313e352e7a373b39")
      "me@usamaejaz.com"

  """
  def go(encoded \\ false) do
    [a, b | tail] = unless encoded, do: take_string(), else: String.codepoints(encoded)

    key = String.to_integer(a <> b, 16)

    tail
    |> create_bits([])
    |> decode(key)
    |> List.to_string()
  end


  # HELPERS
  defp create_bits([a, b | tail], acc), do: create_bits(tail, acc ++ List.wrap(a <> b))

  defp create_bits([], acc), do: acc

  defp decode(list_of_bit, key) do
    for bit <- list_of_bit, do: <<Bitwise.bxor(key, String.to_integer(bit, 16))::utf8>>
  end

  # TAKE STRING FROM IEX ¯\_(ツ)_/¯
  defp take_string do
    IO.gets("put encoded email to decode: ")
      |> String.trim
      |> String.codepoints
  end
end
