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
