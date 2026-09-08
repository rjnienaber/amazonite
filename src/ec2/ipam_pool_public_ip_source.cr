private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPoolPublicIpSource
    Amazon
    Byoip

    def self.to_json(e : IpamPoolPublicIpSource, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPoolPublicIpSource::Amazon then "amazon"
              when AEC::IpamPoolPublicIpSource::Byoip  then "byoip"
              else
                raise Exception.new("unknown enum value for 'IpamPoolPublicIpSource' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPoolPublicIpSource
      value = pull.read_string
      case value
      when "amazon" then AEC::IpamPoolPublicIpSource::Amazon
      when "byoip"  then AEC::IpamPoolPublicIpSource::Byoip
      else
        raise Exception.new("unknown enum value for 'IpamPoolPublicIpSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPoolPublicIpSource::Amazon then "amazon"
      when AEC::IpamPoolPublicIpSource::Byoip  then "byoip"
      else
        raise Exception.new("unknown enum value for 'IpamPoolPublicIpSource' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPoolPublicIpSource?
      case key
      when "amazon" then AEC::IpamPoolPublicIpSource::Amazon
      when "byoip"  then AEC::IpamPoolPublicIpSource::Byoip
      else
        nil
      end
    end
  end
end
