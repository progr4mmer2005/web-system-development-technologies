require "test_helper"
require_relative "../../script/string_extensions"

class StringExtensionsTest < ActiveSupport::TestCase
  test "string palindrome checks the original character order" do
    assert "deified".palindrome?
    refute "foobar".palindrome?
    refute "Level".palindrome?
  end

  test "string shuffle preserves repeated and Unicode characters without changing the source" do
    source = "foobarабба".freeze
    shuffled = source.shuffle

    assert_instance_of String, shuffled
    assert_equal source.chars.sort, shuffled.chars.sort
    assert_equal "foobarабба", source
  end

  test "string shuffle supports empty and single character strings" do
    assert_equal "", "".shuffle
    assert_equal "a", "a".shuffle
  end
end
