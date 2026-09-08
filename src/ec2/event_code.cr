private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EventCode
    InstanceReboot
    SystemReboot
    SystemMaintenance
    InstanceRetirement
    InstanceStop

    def self.to_json(e : EventCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::EventCode::InstanceReboot     then "instance-reboot"
              when AEC::EventCode::SystemReboot       then "system-reboot"
              when AEC::EventCode::SystemMaintenance  then "system-maintenance"
              when AEC::EventCode::InstanceRetirement then "instance-retirement"
              when AEC::EventCode::InstanceStop       then "instance-stop"
              else
                raise Exception.new("unknown enum value for 'EventCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EventCode
      value = pull.read_string
      case value
      when "instance-reboot"     then AEC::EventCode::InstanceReboot
      when "system-reboot"       then AEC::EventCode::SystemReboot
      when "system-maintenance"  then AEC::EventCode::SystemMaintenance
      when "instance-retirement" then AEC::EventCode::InstanceRetirement
      when "instance-stop"       then AEC::EventCode::InstanceStop
      else
        raise Exception.new("unknown enum value for 'EventCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EventCode::InstanceReboot     then "instance-reboot"
      when AEC::EventCode::SystemReboot       then "system-reboot"
      when AEC::EventCode::SystemMaintenance  then "system-maintenance"
      when AEC::EventCode::InstanceRetirement then "instance-retirement"
      when AEC::EventCode::InstanceStop       then "instance-stop"
      else
        raise Exception.new("unknown enum value for 'EventCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EventCode?
      case key
      when "instance-reboot"     then AEC::EventCode::InstanceReboot
      when "system-reboot"       then AEC::EventCode::SystemReboot
      when "system-maintenance"  then AEC::EventCode::SystemMaintenance
      when "instance-retirement" then AEC::EventCode::InstanceRetirement
      when "instance-stop"       then AEC::EventCode::InstanceStop
      else
        nil
      end
    end
  end
end
