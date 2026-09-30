private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamOverlapStatus
    Overlapping
    Nonoverlapping
    Ignored

    def self.to_json(e : IpamOverlapStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamOverlapStatus::Overlapping    then "overlapping"
              when AEC::IpamOverlapStatus::Nonoverlapping then "nonoverlapping"
              when AEC::IpamOverlapStatus::Ignored        then "ignored"
              else
                raise Exception.new("unknown enum value for 'IpamOverlapStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamOverlapStatus
      value = pull.read_string
      case value
      when "overlapping"    then AEC::IpamOverlapStatus::Overlapping
      when "nonoverlapping" then AEC::IpamOverlapStatus::Nonoverlapping
      when "ignored"        then AEC::IpamOverlapStatus::Ignored
      else
        raise Exception.new("unknown enum value for 'IpamOverlapStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamOverlapStatus::Overlapping    then "overlapping"
      when AEC::IpamOverlapStatus::Nonoverlapping then "nonoverlapping"
      when AEC::IpamOverlapStatus::Ignored        then "ignored"
      else
        raise Exception.new("unknown enum value for 'IpamOverlapStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamOverlapStatus?
      case key
      when "overlapping"    then AEC::IpamOverlapStatus::Overlapping
      when "nonoverlapping" then AEC::IpamOverlapStatus::Nonoverlapping
      when "ignored"        then AEC::IpamOverlapStatus::Ignored
      else
        nil
      end
    end
  end
end
