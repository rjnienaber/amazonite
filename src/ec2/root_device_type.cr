private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RootDeviceType
    Ebs
    InstanceStore

    def self.to_json(e : RootDeviceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::RootDeviceType::Ebs           then "ebs"
              when AEC::RootDeviceType::InstanceStore then "instance-store"
              else
                raise Exception.new("unknown enum value for 'RootDeviceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RootDeviceType
      value = pull.read_string
      case value
      when "ebs"            then AEC::RootDeviceType::Ebs
      when "instance-store" then AEC::RootDeviceType::InstanceStore
      else
        raise Exception.new("unknown enum value for 'RootDeviceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RootDeviceType::Ebs           then "ebs"
      when AEC::RootDeviceType::InstanceStore then "instance-store"
      else
        raise Exception.new("unknown enum value for 'RootDeviceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RootDeviceType?
      case key
      when "ebs"            then AEC::RootDeviceType::Ebs
      when "instance-store" then AEC::RootDeviceType::InstanceStore
      else
        nil
      end
    end
  end
end
