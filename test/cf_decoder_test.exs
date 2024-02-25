defmodule CFDecoderTest do
  use ExUnit.Case
  doctest CFDecoder

  test "main" do
    assert CFDecoder.go("543931142127353935313e352e7a373b39") == "me@usamaejaz.com"
  end
end
