private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum NodeFilterKey
    AgentType
    AgentVersion
    ComputerName
    InstanceId
    InstanceStatus
    IpAddress
    ManagedStatus
    PlatformName
    PlatformType
    PlatformVersion
    ResourceType
    OrganizationalUnitId
    OrganizationalUnitPath
    Region
    AccountId
    SourceType
    SourceId
    SourceLocation
    AvailabilityZone
    AvailabilityZoneId

    def self.to_json(e : NodeFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::NodeFilterKey
      value = pull.read_string
      case value
      when "AgentType"              then AS::NodeFilterKey::AgentType
      when "AgentVersion"           then AS::NodeFilterKey::AgentVersion
      when "ComputerName"           then AS::NodeFilterKey::ComputerName
      when "InstanceId"             then AS::NodeFilterKey::InstanceId
      when "InstanceStatus"         then AS::NodeFilterKey::InstanceStatus
      when "IpAddress"              then AS::NodeFilterKey::IpAddress
      when "ManagedStatus"          then AS::NodeFilterKey::ManagedStatus
      when "PlatformName"           then AS::NodeFilterKey::PlatformName
      when "PlatformType"           then AS::NodeFilterKey::PlatformType
      when "PlatformVersion"        then AS::NodeFilterKey::PlatformVersion
      when "ResourceType"           then AS::NodeFilterKey::ResourceType
      when "OrganizationalUnitId"   then AS::NodeFilterKey::OrganizationalUnitId
      when "OrganizationalUnitPath" then AS::NodeFilterKey::OrganizationalUnitPath
      when "Region"                 then AS::NodeFilterKey::Region
      when "AccountId"              then AS::NodeFilterKey::AccountId
      when "SourceType"             then AS::NodeFilterKey::SourceType
      when "SourceId"               then AS::NodeFilterKey::SourceId
      when "SourceLocation"         then AS::NodeFilterKey::SourceLocation
      when "AvailabilityZone"       then AS::NodeFilterKey::AvailabilityZone
      when "AvailabilityZoneId"     then AS::NodeFilterKey::AvailabilityZoneId
      else
        raise Exception.new("unknown enum value for 'NodeFilterKey' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::NodeFilterKey?
      case key
      when "AgentType"              then AS::NodeFilterKey::AgentType
      when "AgentVersion"           then AS::NodeFilterKey::AgentVersion
      when "ComputerName"           then AS::NodeFilterKey::ComputerName
      when "InstanceId"             then AS::NodeFilterKey::InstanceId
      when "InstanceStatus"         then AS::NodeFilterKey::InstanceStatus
      when "IpAddress"              then AS::NodeFilterKey::IpAddress
      when "ManagedStatus"          then AS::NodeFilterKey::ManagedStatus
      when "PlatformName"           then AS::NodeFilterKey::PlatformName
      when "PlatformType"           then AS::NodeFilterKey::PlatformType
      when "PlatformVersion"        then AS::NodeFilterKey::PlatformVersion
      when "ResourceType"           then AS::NodeFilterKey::ResourceType
      when "OrganizationalUnitId"   then AS::NodeFilterKey::OrganizationalUnitId
      when "OrganizationalUnitPath" then AS::NodeFilterKey::OrganizationalUnitPath
      when "Region"                 then AS::NodeFilterKey::Region
      when "AccountId"              then AS::NodeFilterKey::AccountId
      when "SourceType"             then AS::NodeFilterKey::SourceType
      when "SourceId"               then AS::NodeFilterKey::SourceId
      when "SourceLocation"         then AS::NodeFilterKey::SourceLocation
      when "AvailabilityZone"       then AS::NodeFilterKey::AvailabilityZone
      when "AvailabilityZoneId"     then AS::NodeFilterKey::AvailabilityZoneId
      else
        nil
      end
    end
  end
end
