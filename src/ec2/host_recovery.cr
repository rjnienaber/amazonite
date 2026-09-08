private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum HostRecovery
    On
    Off

    def self.to_json(e : HostRecovery, json : JSON::Builder) : Nil
      value = case e
              when AEC::HostRecovery::On  then "on"
              when AEC::HostRecovery::Off then "off"
              else
                raise Exception.new("unknown enum value for 'HostRecovery' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::HostRecovery
      value = pull.read_string
      case value
      when "on"  then AEC::HostRecovery::On
      when "off" then AEC::HostRecovery::Off
      else
        raise Exception.new("unknown enum value for 'HostRecovery' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::HostRecovery::On  then "on"
      when AEC::HostRecovery::Off then "off"
      else
        raise Exception.new("unknown enum value for 'HostRecovery' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::HostRecovery?
      case key
      when "on"  then AEC::HostRecovery::On
      when "off" then AEC::HostRecovery::Off
      else
        nil
      end
    end
  end
end
