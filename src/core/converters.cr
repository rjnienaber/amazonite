require "base64"

module Amazonite::Core::AWSEpochConverter
  def self.to_json(value : Time, json : JSON::Builder) : Nil
    json.number(value.to_unix_ms.to_f / 1000)
  end

  def self.from_json(pull : JSON::PullParser)
    Time.unix_ms((pull.read_float * 1000).to_i64)
  end
end

module Amazonite::Core::ArrayConverter(T)
  def self.to_json(values : Array(T), json : JSON::Builder) : Nil
    json.array do
      values.each { |value| T.to_json(value, json) }
    end
  end

  def self.from_json(pull : JSON::PullParser) : Array(T)
    result = [] of T
    pull.read_array do
      result << T.from_json(pull)
    end
    result
  end
end

# AWS blob shapes travel over the wire as base64-encoded JSON strings. This
# converter lets generated models expose them as `Bytes` instead of making
# every caller base64-encode/decode by hand.
module Amazonite::Core::Base64Converter
  def self.to_json(value : Bytes, json : JSON::Builder) : Nil
    json.string(Base64.strict_encode(value))
  end

  def self.from_json(pull : JSON::PullParser) : Bytes
    Base64.decode(pull.read_string)
  end
end

# Base64Converter for lists of blobs (e.g. DynamoDB's BS binary set) - kept
# separate from ArrayConverter(T) because that converter assumes the element
# type doubles as its own converter module, which isn't true for Bytes.
module Amazonite::Core::Base64ArrayConverter
  def self.to_json(values : Array(Bytes), json : JSON::Builder) : Nil
    json.array do
      values.each { |value| Base64Converter.to_json(value, json) }
    end
  end

  def self.from_json(pull : JSON::PullParser) : Array(Bytes)
    result = [] of Bytes
    pull.read_array do
      result << Base64Converter.from_json(pull)
    end
    result
  end
end
