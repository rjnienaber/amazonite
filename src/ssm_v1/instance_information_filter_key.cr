private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum InstanceInformationFilterKey
    InstanceIds
    AgentVersion
    PingStatus
    PlatformTypes
    ActivationIds
    IamRole
    ResourceType
    AssociationStatus

    def self.to_json(e : InstanceInformationFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InstanceInformationFilterKey
      value = pull.read_string
      case value
      when "InstanceIds"       then AS::InstanceInformationFilterKey::InstanceIds
      when "AgentVersion"      then AS::InstanceInformationFilterKey::AgentVersion
      when "PingStatus"        then AS::InstanceInformationFilterKey::PingStatus
      when "PlatformTypes"     then AS::InstanceInformationFilterKey::PlatformTypes
      when "ActivationIds"     then AS::InstanceInformationFilterKey::ActivationIds
      when "IamRole"           then AS::InstanceInformationFilterKey::IamRole
      when "ResourceType"      then AS::InstanceInformationFilterKey::ResourceType
      when "AssociationStatus" then AS::InstanceInformationFilterKey::AssociationStatus
      else
        raise Exception.new("unknown enum value for 'InstanceInformationFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
