private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class InstanceInfo
    include JSON::Serializable

    @[JSON::Field(key: "AgentType")]
    property agent_type : String | Nil

    @[JSON::Field(key: "AgentVersion")]
    property agent_version : String | Nil

    @[JSON::Field(key: "ComputerName")]
    property computer_name : String | Nil

    @[JSON::Field(key: "InstanceStatus")]
    property instance_status : String | Nil

    @[JSON::Field(key: "IpAddress")]
    property ip_address : String | Nil

    @[JSON::Field(key: "ManagedStatus", converter: AS::ManagedStatus)]
    property managed_status : ManagedStatus | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "PlatformType", converter: AS::PlatformType)]
    property platform_type : PlatformType | Nil

    @[JSON::Field(key: "PlatformName")]
    property platform_name : String | Nil

    @[JSON::Field(key: "PlatformVersion")]
    property platform_version : String | Nil

    @[JSON::Field(key: "ResourceType", converter: AS::ResourceType)]
    property resource_type : ResourceType | Nil

    @[JSON::Field(key: "SourceType", converter: AS::SourceType)]
    property source_type : SourceType | Nil

    @[JSON::Field(key: "SourceId")]
    property source_id : String | Nil

    @[JSON::Field(key: "SourceLocation")]
    property source_location : String | Nil

    @[JSON::Field(key: "AvailabilityZone")]
    property availability_zone : String | Nil

    @[JSON::Field(key: "AvailabilityZoneId")]
    property availability_zone_id : String | Nil

    def initialize(
      @agent_type : String | Nil = nil,
      @agent_version : String | Nil = nil,
      @computer_name : String | Nil = nil,
      @instance_status : String | Nil = nil,
      @ip_address : String | Nil = nil,
      @managed_status : ManagedStatus | Nil = nil,
      @name : String | Nil = nil,
      @platform_type : PlatformType | Nil = nil,
      @platform_name : String | Nil = nil,
      @platform_version : String | Nil = nil,
      @resource_type : ResourceType | Nil = nil,
      @source_type : SourceType | Nil = nil,
      @source_id : String | Nil = nil,
      @source_location : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end
  end
end
