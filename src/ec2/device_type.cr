private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DeviceType
    Ebs
    InstanceStore

    def self.to_json(e : DeviceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::DeviceType::Ebs           then "ebs"
              when AEC::DeviceType::InstanceStore then "instance-store"
              else
                raise Exception.new("unknown enum value for 'DeviceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DeviceType
      value = pull.read_string
      case value
      when "ebs"            then AEC::DeviceType::Ebs
      when "instance-store" then AEC::DeviceType::InstanceStore
      else
        raise Exception.new("unknown enum value for 'DeviceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DeviceType::Ebs           then "ebs"
      when AEC::DeviceType::InstanceStore then "instance-store"
      else
        raise Exception.new("unknown enum value for 'DeviceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DeviceType?
      case key
      when "ebs"            then AEC::DeviceType::Ebs
      when "instance-store" then AEC::DeviceType::InstanceStore
      else
        nil
      end
    end
  end
end
