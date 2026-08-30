private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Details about a specific managed node.
  class InstanceInfo
    include JSON::Serializable

    # The type of agent installed on the node.
    @[JSON::Field(key: "AgentType")]
    property agent_type : String | Nil

    # The version number of the agent installed on the node.
    @[JSON::Field(key: "AgentVersion")]
    property agent_version : String | Nil

    # The fully qualified host name of the managed node.
    @[JSON::Field(key: "ComputerName")]
    property computer_name : String | Nil

    # The current status of the managed node.
    @[JSON::Field(key: "InstanceStatus")]
    property instance_status : String | Nil

    # The IP address of the managed node.
    @[JSON::Field(key: "IpAddress")]
    property ip_address : String | Nil

    # Indicates whether the node is managed by Systems Manager.
    @[JSON::Field(key: "ManagedStatus", converter: AS::ManagedStatus)]
    property managed_status : ManagedStatus | Nil

    # The name assigned to the managed node.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The operating system platform type of the managed node.
    @[JSON::Field(key: "PlatformType", converter: AS::PlatformType)]
    property platform_type : PlatformType | Nil

    # The name of the operating system platform running on your managed node.
    @[JSON::Field(key: "PlatformName")]
    property platform_name : String | Nil

    # The version of the OS platform running on your managed node.
    @[JSON::Field(key: "PlatformVersion")]
    property platform_version : String | Nil

    # The type of instance, either an EC2 instance or another supported machine type in a hybrid
    # fleet.
    @[JSON::Field(key: "ResourceType", converter: AS::ResourceType)]
    property resource_type : ResourceType | Nil

    # The type of the source resource. For IoT Greengrass devices, `SourceType` is `AWS::IoT::Thing`.
    @[JSON::Field(key: "SourceType", converter: AS::SourceType)]
    property source_type : SourceType | Nil

    # The ID of the source resource. For IoT Greengrass devices, `SourceId` is the Thing name.
    @[JSON::Field(key: "SourceId")]
    property source_id : String | Nil

    # The location of the source resource in the third-party cloud environment.
    @[JSON::Field(key: "SourceLocation")]
    property source_location : String | Nil

    # The Availability Zone where the managed node is located.
    @[JSON::Field(key: "AvailabilityZone")]
    property availability_zone : String | Nil

    # The Availability Zone ID where the managed node is located.
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
