private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum ScanBy
    TimestampDescending
    TimestampAscending

    def self.to_json(e : ScanBy, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::ScanBy
      value = pull.read_string
      case value
      when "TimestampDescending" then ACW::ScanBy::TimestampDescending
      when "TimestampAscending"  then ACW::ScanBy::TimestampAscending
      else
        raise Exception.new("unknown enum value for 'ScanBy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACW::ScanBy?
      case key
      when "TimestampDescending" then ACW::ScanBy::TimestampDescending
      when "TimestampAscending"  then ACW::ScanBy::TimestampAscending
      else
        nil
      end
    end
  end
end
