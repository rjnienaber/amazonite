private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum OrderBy
    LogStreamName
    LastEventTime

    def self.to_json(e : OrderBy, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::OrderBy
      value = pull.read_string
      case value
      when "LogStreamName" then ACWL::OrderBy::LogStreamName
      when "LastEventTime" then ACWL::OrderBy::LastEventTime
      else
        raise Exception.new("unknown enum value for 'OrderBy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACWL::OrderBy?
      case key
      when "LogStreamName" then ACWL::OrderBy::LogStreamName
      when "LastEventTime" then ACWL::OrderBy::LastEventTime
      else
        nil
      end
    end
  end
end
