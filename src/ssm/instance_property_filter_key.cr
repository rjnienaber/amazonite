private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum InstancePropertyFilterKey
    InstanceIds
    AgentVersion
    PingStatus
    PlatformTypes
    DocumentName
    ActivationIds
    IamRole
    ResourceType
    AssociationStatus

    def self.to_json(e : InstancePropertyFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InstancePropertyFilterKey
      value = pull.read_string
      case value
      when "InstanceIds"       then AS::InstancePropertyFilterKey::InstanceIds
      when "AgentVersion"      then AS::InstancePropertyFilterKey::AgentVersion
      when "PingStatus"        then AS::InstancePropertyFilterKey::PingStatus
      when "PlatformTypes"     then AS::InstancePropertyFilterKey::PlatformTypes
      when "DocumentName"      then AS::InstancePropertyFilterKey::DocumentName
      when "ActivationIds"     then AS::InstancePropertyFilterKey::ActivationIds
      when "IamRole"           then AS::InstancePropertyFilterKey::IamRole
      when "ResourceType"      then AS::InstancePropertyFilterKey::ResourceType
      when "AssociationStatus" then AS::InstancePropertyFilterKey::AssociationStatus
      else
        raise Exception.new("unknown enum value for 'InstancePropertyFilterKey' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::InstancePropertyFilterKey?
      case key
      when "InstanceIds"       then AS::InstancePropertyFilterKey::InstanceIds
      when "AgentVersion"      then AS::InstancePropertyFilterKey::AgentVersion
      when "PingStatus"        then AS::InstancePropertyFilterKey::PingStatus
      when "PlatformTypes"     then AS::InstancePropertyFilterKey::PlatformTypes
      when "DocumentName"      then AS::InstancePropertyFilterKey::DocumentName
      when "ActivationIds"     then AS::InstancePropertyFilterKey::ActivationIds
      when "IamRole"           then AS::InstancePropertyFilterKey::IamRole
      when "ResourceType"      then AS::InstancePropertyFilterKey::ResourceType
      when "AssociationStatus" then AS::InstancePropertyFilterKey::AssociationStatus
      else
        nil
      end
    end
  end
end
