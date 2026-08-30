private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum OCSFVersion
    V11
    V15

    def self.to_json(e : OCSFVersion, json : JSON::Builder) : Nil
      value = case e
              when ACWL::OCSFVersion::V11 then "V1.1"
              when ACWL::OCSFVersion::V15 then "V1.5"
              else
                raise Exception.new("unknown enum value for 'OCSFVersion' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::OCSFVersion
      value = pull.read_string
      case value
      when "V1.1" then ACWL::OCSFVersion::V11
      when "V1.5" then ACWL::OCSFVersion::V15
      else
        raise Exception.new("unknown enum value for 'OCSFVersion' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::OCSFVersion::V11 then "V1.1"
      when ACWL::OCSFVersion::V15 then "V1.5"
      else
        raise Exception.new("unknown enum value for 'OCSFVersion' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::OCSFVersion?
      case key
      when "V1.1" then ACWL::OCSFVersion::V11
      when "V1.5" then ACWL::OCSFVersion::V15
      else
        nil
      end
    end
  end
end
