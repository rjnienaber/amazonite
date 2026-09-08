private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NetworkInterfaceStatus
    Available
    Associated
    Attaching
    InUse
    Detaching

    def self.to_json(e : NetworkInterfaceStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::NetworkInterfaceStatus::Available  then "available"
              when AEC::NetworkInterfaceStatus::Associated then "associated"
              when AEC::NetworkInterfaceStatus::Attaching  then "attaching"
              when AEC::NetworkInterfaceStatus::InUse      then "in-use"
              when AEC::NetworkInterfaceStatus::Detaching  then "detaching"
              else
                raise Exception.new("unknown enum value for 'NetworkInterfaceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NetworkInterfaceStatus
      value = pull.read_string
      case value
      when "available"  then AEC::NetworkInterfaceStatus::Available
      when "associated" then AEC::NetworkInterfaceStatus::Associated
      when "attaching"  then AEC::NetworkInterfaceStatus::Attaching
      when "in-use"     then AEC::NetworkInterfaceStatus::InUse
      when "detaching"  then AEC::NetworkInterfaceStatus::Detaching
      else
        raise Exception.new("unknown enum value for 'NetworkInterfaceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NetworkInterfaceStatus::Available  then "available"
      when AEC::NetworkInterfaceStatus::Associated then "associated"
      when AEC::NetworkInterfaceStatus::Attaching  then "attaching"
      when AEC::NetworkInterfaceStatus::InUse      then "in-use"
      when AEC::NetworkInterfaceStatus::Detaching  then "detaching"
      else
        raise Exception.new("unknown enum value for 'NetworkInterfaceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NetworkInterfaceStatus?
      case key
      when "available"  then AEC::NetworkInterfaceStatus::Available
      when "associated" then AEC::NetworkInterfaceStatus::Associated
      when "attaching"  then AEC::NetworkInterfaceStatus::Attaching
      when "in-use"     then AEC::NetworkInterfaceStatus::InUse
      when "detaching"  then AEC::NetworkInterfaceStatus::Detaching
      else
        nil
      end
    end
  end
end
