private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpSource
    Amazon
    Byoip
    None

    def self.to_json(e : IpSource, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpSource::Amazon then "amazon"
              when AEC::IpSource::Byoip  then "byoip"
              when AEC::IpSource::None   then "none"
              else
                raise Exception.new("unknown enum value for 'IpSource' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpSource
      value = pull.read_string
      case value
      when "amazon" then AEC::IpSource::Amazon
      when "byoip"  then AEC::IpSource::Byoip
      when "none"   then AEC::IpSource::None
      else
        raise Exception.new("unknown enum value for 'IpSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpSource::Amazon then "amazon"
      when AEC::IpSource::Byoip  then "byoip"
      when AEC::IpSource::None   then "none"
      else
        raise Exception.new("unknown enum value for 'IpSource' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpSource?
      case key
      when "amazon" then AEC::IpSource::Amazon
      when "byoip"  then AEC::IpSource::Byoip
      when "none"   then AEC::IpSource::None
      else
        nil
      end
    end
  end
end
