private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPoolSourceResourceType
    Vpc

    def self.to_json(e : IpamPoolSourceResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPoolSourceResourceType::Vpc then "vpc"
              else
                raise Exception.new("unknown enum value for 'IpamPoolSourceResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPoolSourceResourceType
      value = pull.read_string
      case value
      when "vpc" then AEC::IpamPoolSourceResourceType::Vpc
      else
        raise Exception.new("unknown enum value for 'IpamPoolSourceResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPoolSourceResourceType::Vpc then "vpc"
      else
        raise Exception.new("unknown enum value for 'IpamPoolSourceResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPoolSourceResourceType?
      case key
      when "vpc" then AEC::IpamPoolSourceResourceType::Vpc
      else
        nil
      end
    end
  end
end
