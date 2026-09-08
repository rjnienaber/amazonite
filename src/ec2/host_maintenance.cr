private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum HostMaintenance
    On
    Off

    def self.to_json(e : HostMaintenance, json : JSON::Builder) : Nil
      value = case e
              when AEC::HostMaintenance::On  then "on"
              when AEC::HostMaintenance::Off then "off"
              else
                raise Exception.new("unknown enum value for 'HostMaintenance' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::HostMaintenance
      value = pull.read_string
      case value
      when "on"  then AEC::HostMaintenance::On
      when "off" then AEC::HostMaintenance::Off
      else
        raise Exception.new("unknown enum value for 'HostMaintenance' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::HostMaintenance::On  then "on"
      when AEC::HostMaintenance::Off then "off"
      else
        raise Exception.new("unknown enum value for 'HostMaintenance' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::HostMaintenance?
      case key
      when "on"  then AEC::HostMaintenance::On
      when "off" then AEC::HostMaintenance::Off
      else
        nil
      end
    end
  end
end
