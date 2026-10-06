require "test_helper"

class RubyTutorialTest < ActiveSupport::TestCase
  test "string message accepts both empty and nonempty strings" do
    assert_equal "It's an empty string!", RubyTutorial.string_message
    assert_equal "It's an empty string!", RubyTutorial.string_message("")
    assert_equal "The string is nonempty.", RubyTutorial.string_message("foobar")
  end

  test "string shuffle preserves repeated and Unicode characters without changing the source" do
    source = "foobarабба".freeze
    shuffled = RubyTutorial.string_shuffle(source)

    assert_instance_of String, shuffled
    assert_equal source.chars.sort, shuffled.chars.sort
    assert_equal "foobarабба", source
  end

  test "string shuffle supports empty and single character strings" do
    assert_equal "", RubyTutorial.string_shuffle("")
    assert_equal "a", RubyTutorial.string_shuffle("a")
  end

  test "word detects palindromes and inherits string methods" do
    word = RubyTutorial::Word.new("level")

    assert word.palindrome?
    refute RubyTutorial::Word.new("foobar").palindrome?
    assert_equal 5, word.length
    assert_kind_of String, word
  end

  test "user attributes can be assigned after construction" do
    user = RubyTutorial::User.new
    assert_nil user.name
    assert_nil user.email

    user.name = "Example User"
    user.email = "user@example.com"
    assert_equal "Example User <user@example.com>", user.formatted_email
  end

  test "user initializes attributes from a hash and keeps them per instance" do
    user = RubyTutorial::User.new(name: "Michael Hartl", email: "mhartl@example.com")

    assert_equal "Michael Hartl", user.name
    assert_equal "mhartl@example.com", user.email
    assert_equal "Michael Hartl <mhartl@example.com>", user.formatted_email
    assert_nil RubyTutorial::User.new.name
  end

  test "family params provide each person's first and last name" do
    params = RubyTutorial.family_params

    assert_equal "Michael", params[:father][:first]
    assert_equal "Jane", params[:mother][:first]
    assert_equal "Sam", params[:child][:first]
    assert_equal %i[first last], params[:child].keys
  end

  test "merge keeps unique keys and takes the second hash's duplicate value" do
    assert_equal({ "a" => 100, "b" => 300 }, RubyTutorial.merge_example)
  end
end
