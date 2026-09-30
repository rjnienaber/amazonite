private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum SyslogSourceType
    Vpce

    def self.to_json(e : SyslogSourceType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::SyslogSourceType::Vpce then "VPCE"
              else
                raise Exception.new("unknown enum value for 'SyslogSourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::SyslogSourceType
      value = pull.read_string
      case value
      when "VPCE" then ACWL::SyslogSourceType::Vpce
      else
        raise Exception.new("unknown enum value for 'SyslogSourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::SyslogSourceType::Vpce then "VPCE"
      else
        raise Exception.new("unknown enum value for 'SyslogSourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::SyslogSourceType?
      case key
      when "VPCE" then ACWL::SyslogSourceType::Vpce
      else
        nil
      end
    end
  end
end
