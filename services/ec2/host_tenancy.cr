private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum HostTenancy
    Default
    Dedicated
    Host

    def self.to_json(e : HostTenancy, json : JSON::Builder) : Nil
      value = case e
              when AEC::HostTenancy::Default   then "default"
              when AEC::HostTenancy::Dedicated then "dedicated"
              when AEC::HostTenancy::Host      then "host"
              else
                raise Exception.new("unknown enum value for 'HostTenancy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::HostTenancy
      value = pull.read_string
      case value
      when "default"   then AEC::HostTenancy::Default
      when "dedicated" then AEC::HostTenancy::Dedicated
      when "host"      then AEC::HostTenancy::Host
      else
        raise Exception.new("unknown enum value for 'HostTenancy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::HostTenancy::Default   then "default"
      when AEC::HostTenancy::Dedicated then "dedicated"
      when AEC::HostTenancy::Host      then "host"
      else
        raise Exception.new("unknown enum value for 'HostTenancy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::HostTenancy?
      case key
      when "default"   then AEC::HostTenancy::Default
      when "dedicated" then AEC::HostTenancy::Dedicated
      when "host"      then AEC::HostTenancy::Host
      else
        nil
      end
    end
  end
end
