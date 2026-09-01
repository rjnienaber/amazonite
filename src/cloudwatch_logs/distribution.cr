private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  # The method used to distribute log data to the destination, which can be either random or grouped
  # by log stream.
  enum Distribution
    Random
    ByLogStream

    def self.to_json(e : Distribution, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::Distribution
      value = pull.read_string
      case value
      when "Random"      then ACWL::Distribution::Random
      when "ByLogStream" then ACWL::Distribution::ByLogStream
      else
        raise Exception.new("unknown enum value for 'Distribution' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACWL::Distribution?
      case key
      when "Random"      then ACWL::Distribution::Random
      when "ByLogStream" then ACWL::Distribution::ByLogStream
      else
        nil
      end
    end
  end
end
