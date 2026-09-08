private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamResourceCidrIpSource
    Amazon
    Byoip
    None

    def self.to_json(e : IpamResourceCidrIpSource, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamResourceCidrIpSource::Amazon then "amazon"
              when AEC::IpamResourceCidrIpSource::Byoip  then "byoip"
              when AEC::IpamResourceCidrIpSource::None   then "none"
              else
                raise Exception.new("unknown enum value for 'IpamResourceCidrIpSource' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamResourceCidrIpSource
      value = pull.read_string
      case value
      when "amazon" then AEC::IpamResourceCidrIpSource::Amazon
      when "byoip"  then AEC::IpamResourceCidrIpSource::Byoip
      when "none"   then AEC::IpamResourceCidrIpSource::None
      else
        raise Exception.new("unknown enum value for 'IpamResourceCidrIpSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamResourceCidrIpSource::Amazon then "amazon"
      when AEC::IpamResourceCidrIpSource::Byoip  then "byoip"
      when AEC::IpamResourceCidrIpSource::None   then "none"
      else
        raise Exception.new("unknown enum value for 'IpamResourceCidrIpSource' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamResourceCidrIpSource?
      case key
      when "amazon" then AEC::IpamResourceCidrIpSource::Amazon
      when "byoip"  then AEC::IpamResourceCidrIpSource::Byoip
      when "none"   then AEC::IpamResourceCidrIpSource::None
      else
        nil
      end
    end
  end
end
