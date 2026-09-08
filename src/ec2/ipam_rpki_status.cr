private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The RPKI validation status of a BGP route.
  enum IpamRpkiStatus
    Valid
    Invalid
    Unknown

    def self.to_json(e : IpamRpkiStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamRpkiStatus::Valid   then "valid"
              when AEC::IpamRpkiStatus::Invalid then "invalid"
              when AEC::IpamRpkiStatus::Unknown then "unknown"
              else
                raise Exception.new("unknown enum value for 'IpamRpkiStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamRpkiStatus
      value = pull.read_string
      case value
      when "valid"   then AEC::IpamRpkiStatus::Valid
      when "invalid" then AEC::IpamRpkiStatus::Invalid
      when "unknown" then AEC::IpamRpkiStatus::Unknown
      else
        raise Exception.new("unknown enum value for 'IpamRpkiStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamRpkiStatus::Valid   then "valid"
      when AEC::IpamRpkiStatus::Invalid then "invalid"
      when AEC::IpamRpkiStatus::Unknown then "unknown"
      else
        raise Exception.new("unknown enum value for 'IpamRpkiStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamRpkiStatus?
      case key
      when "valid"   then AEC::IpamRpkiStatus::Valid
      when "invalid" then AEC::IpamRpkiStatus::Invalid
      when "unknown" then AEC::IpamRpkiStatus::Unknown
      else
        nil
      end
    end
  end
end
