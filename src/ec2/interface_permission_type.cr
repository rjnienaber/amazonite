private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InterfacePermissionType
    InstanceAttach
    EipAssociate

    def self.to_json(e : InterfacePermissionType, json : JSON::Builder) : Nil
      value = case e
              when AEC::InterfacePermissionType::InstanceAttach then "INSTANCE-ATTACH"
              when AEC::InterfacePermissionType::EipAssociate   then "EIP-ASSOCIATE"
              else
                raise Exception.new("unknown enum value for 'InterfacePermissionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InterfacePermissionType
      value = pull.read_string
      case value
      when "INSTANCE-ATTACH" then AEC::InterfacePermissionType::InstanceAttach
      when "EIP-ASSOCIATE"   then AEC::InterfacePermissionType::EipAssociate
      else
        raise Exception.new("unknown enum value for 'InterfacePermissionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InterfacePermissionType::InstanceAttach then "INSTANCE-ATTACH"
      when AEC::InterfacePermissionType::EipAssociate   then "EIP-ASSOCIATE"
      else
        raise Exception.new("unknown enum value for 'InterfacePermissionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InterfacePermissionType?
      case key
      when "INSTANCE-ATTACH" then AEC::InterfacePermissionType::InstanceAttach
      when "EIP-ASSOCIATE"   then AEC::InterfacePermissionType::EipAssociate
      else
        nil
      end
    end
  end
end
