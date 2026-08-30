private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # An object containing various properties of a managed node.
  class InstanceProperty
    include JSON::Serializable

    # The value of the EC2 `Name` tag associated with the node. If a `Name` tag hasn't been applied to
    # the node, this value is blank.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The ID of the managed node.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The instance type of the managed node. For example, t3.large.
    @[JSON::Field(key: "InstanceType")]
    property instance_type : String | Nil

    # The instance profile attached to the node. If an instance profile isn't attached to the node,
    # this value is blank.
    @[JSON::Field(key: "InstanceRole")]
    property instance_role : String | Nil

    # The name of the key pair associated with the node. If a key pair isnt't associated with the
    # node, this value is blank.
    @[JSON::Field(key: "KeyName")]
    property key_name : String | Nil

    # The current state of the node.
    @[JSON::Field(key: "InstanceState")]
    property instance_state : String | Nil

    # The CPU architecture of the node. For example, `x86_64`.
    @[JSON::Field(key: "Architecture")]
    property architecture : String | Nil

    # The public IPv4 address assigned to the node. If a public IPv4 address isn't assigned to the
    # node, this value is blank.
    @[JSON::Field(key: "IPAddress")]
    property ip_address : String | Nil

    # The timestamp for when the node was launched.
    @[JSON::Field(key: "LaunchTime", converter: Core::AWSEpochConverter)]
    property launch_time : Time | Nil

    # Connection status of the SSM Agent on the managed node.
    @[JSON::Field(key: "PingStatus", converter: AS::PingStatus)]
    property ping_status : PingStatus | Nil

    # The date and time when the SSM Agent last pinged the Systems Manager service.
    @[JSON::Field(key: "LastPingDateTime", converter: Core::AWSEpochConverter)]
    property last_ping_date_time : Time | Nil

    # The version of SSM Agent running on your managed node.
    @[JSON::Field(key: "AgentVersion")]
    property agent_version : String | Nil

    # The operating system platform type of the managed node. For example, Windows Server or Amazon
    # Linux 2.
    @[JSON::Field(key: "PlatformType", converter: AS::PlatformType)]
    property platform_type : PlatformType | Nil

    # The name of the operating system platform running on your managed node.
    @[JSON::Field(key: "PlatformName")]
    property platform_name : String | Nil

    # The version of the OS platform running on your managed node.
    @[JSON::Field(key: "PlatformVersion")]
    property platform_version : String | Nil

    # The activation ID created by Systems Manager when the server or virtual machine (VM) was
    # registered
    @[JSON::Field(key: "ActivationId")]
    property activation_id : String | Nil

    # The IAM role used in the hybrid activation to register the node with Systems Manager.
    @[JSON::Field(key: "IamRole")]
    property iam_role : String | Nil

    # The date the node was registered with Systems Manager.
    @[JSON::Field(key: "RegistrationDate", converter: Core::AWSEpochConverter)]
    property registration_date : Time | Nil

    # The type of managed node.
    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    # The fully qualified host name of the managed node.
    @[JSON::Field(key: "ComputerName")]
    property computer_name : String | Nil

    # The status of the State Manager association applied to the managed node.
    @[JSON::Field(key: "AssociationStatus")]
    property association_status : String | Nil

    # The date the association was last run.
    @[JSON::Field(key: "LastAssociationExecutionDate", converter: Core::AWSEpochConverter)]
    property last_association_execution_date : Time | Nil

    # The last date the association was successfully run.
    @[JSON::Field(key: "LastSuccessfulAssociationExecutionDate", converter: Core::AWSEpochConverter)]
    property last_successful_association_execution_date : Time | Nil

    @[JSON::Field(key: "AssociationOverview")]
    property association_overview : InstanceAggregatedAssociationOverview | Nil

    # The ID of the source resource.
    @[JSON::Field(key: "SourceId")]
    property source_id : String | Nil

    # The type of the source resource. Valid values: `AWS::EC2::Instance` |
    # `AWS::SSM::ManagedInstance` | `AWS::IoT::Thing` | `Microsoft.Compute/virtualMachines`.
    @[JSON::Field(key: "SourceType", converter: AS::SourceType)]
    property source_type : SourceType | Nil

    # The location of the source resource in the third-party cloud environment.
    @[JSON::Field(key: "SourceLocation")]
    property source_location : String | Nil

    # The Availability Zone where the managed node is located.
    @[JSON::Field(key: "AvailabilityZone")]
    property availability_zone : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @instance_role : String | Nil = nil,
      @key_name : String | Nil = nil,
      @instance_state : String | Nil = nil,
      @architecture : String | Nil = nil,
      @ip_address : String | Nil = nil,
      @launch_time : Time | Nil = nil,
      @ping_status : PingStatus | Nil = nil,
      @last_ping_date_time : Time | Nil = nil,
      @agent_version : String | Nil = nil,
      @platform_type : PlatformType | Nil = nil,
      @platform_name : String | Nil = nil,
      @platform_version : String | Nil = nil,
      @activation_id : String | Nil = nil,
      @iam_role : String | Nil = nil,
      @registration_date : Time | Nil = nil,
      @resource_type : String | Nil = nil,
      @computer_name : String | Nil = nil,
      @association_status : String | Nil = nil,
      @last_association_execution_date : Time | Nil = nil,
      @last_successful_association_execution_date : Time | Nil = nil,
      @association_overview : InstanceAggregatedAssociationOverview | Nil = nil,
      @source_id : String | Nil = nil,
      @source_type : SourceType | Nil = nil,
      @source_location : String | Nil = nil,
      @availability_zone : String | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @instance_id, @instance_type, @instance_role, @key_name, @instance_state, @architecture, @ip_address, @launch_time, @ping_status, @last_ping_date_time, @agent_version, @platform_type, @platform_name, @platform_version, @activation_id, @iam_role, @registration_date, @resource_type, @computer_name, @association_status, @last_association_execution_date, @last_successful_association_execution_date, @association_overview, @source_id, @source_type, @source_location, @availability_zone)
  end
end
