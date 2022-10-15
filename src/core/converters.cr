module Amazonite::Core::AWSEpochConverter
  def self.to_json(value : Time, json : JSON::Builder) : Nil
    json.number(value.to_unix_ms.to_f / 1000)
  end

  def self.from_json(pull : JSON::PullParser)
    Time.unix_ms((pull.read_float * 1000).to_i64)
  end
end
