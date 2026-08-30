private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum ScheduledQueryDestinationType
    S3
    LookupTable

    def self.to_json(e : ScheduledQueryDestinationType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::ScheduledQueryDestinationType::S3          then "S3"
              when ACWL::ScheduledQueryDestinationType::LookupTable then "LOOKUP_TABLE"
              else
                raise Exception.new("unknown enum value for 'ScheduledQueryDestinationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::ScheduledQueryDestinationType
      value = pull.read_string
      case value
      when "S3"           then ACWL::ScheduledQueryDestinationType::S3
      when "LOOKUP_TABLE" then ACWL::ScheduledQueryDestinationType::LookupTable
      else
        raise Exception.new("unknown enum value for 'ScheduledQueryDestinationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::ScheduledQueryDestinationType::S3          then "S3"
      when ACWL::ScheduledQueryDestinationType::LookupTable then "LOOKUP_TABLE"
      else
        raise Exception.new("unknown enum value for 'ScheduledQueryDestinationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::ScheduledQueryDestinationType?
      case key
      when "S3"           then ACWL::ScheduledQueryDestinationType::S3
      when "LOOKUP_TABLE" then ACWL::ScheduledQueryDestinationType::LookupTable
      else
        nil
      end
    end
  end
end
