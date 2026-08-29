private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class InstanceProperty
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "InstanceType")]
    property instance_type : String | Nil

    @[JSON::Field(key: "InstanceRole")]
    property instance_role : String | Nil

    @[JSON::Field(key: "KeyName")]
    property key_name : String | Nil

    @[JSON::Field(key: "InstanceState")]
    property instance_state : String | Nil

    @[JSON::Field(key: "Architecture")]
    property architecture : String | Nil

    @[JSON::Field(key: "IPAddress")]
    property ip_address : String | Nil

    @[JSON::Field(key: "LaunchTime", converter: Core::AWSEpochConverter)]
    property launch_time : Time | Nil

    @[JSON::Field(key: "PingStatus", converter: AS::PingStatus)]
    property ping_status : PingStatus | Nil

    @[JSON::Field(key: "LastPingDateTime", converter: Core::AWSEpochConverter)]
    property last_ping_date_time : Time | Nil

    @[JSON::Field(key: "AgentVersion")]
    property agent_version : String | Nil

    @[JSON::Field(key: "PlatformType", converter: AS::PlatformType)]
    property platform_type : PlatformType | Nil

    @[JSON::Field(key: "PlatformName")]
    property platform_name : String | Nil

    @[JSON::Field(key: "PlatformVersion")]
    property platform_version : String | Nil

    @[JSON::Field(key: "ActivationId")]
    property activation_id : String | Nil

    @[JSON::Field(key: "IamRole")]
    property iam_role : String | Nil

    @[JSON::Field(key: "RegistrationDate", converter: Core::AWSEpochConverter)]
    property registration_date : Time | Nil

    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    @[JSON::Field(key: "ComputerName")]
    property computer_name : String | Nil

    @[JSON::Field(key: "AssociationStatus")]
    property association_status : String | Nil

    @[JSON::Field(key: "LastAssociationExecutionDate", converter: Core::AWSEpochConverter)]
    property last_association_execution_date : Time | Nil

    @[JSON::Field(key: "LastSuccessfulAssociationExecutionDate", converter: Core::AWSEpochConverter)]
    property last_successful_association_execution_date : Time | Nil

    @[JSON::Field(key: "AssociationOverview")]
    property association_overview : InstanceAggregatedAssociationOverview | Nil

    @[JSON::Field(key: "SourceId")]
    property source_id : String | Nil

    @[JSON::Field(key: "SourceType", converter: AS::SourceType)]
    property source_type : SourceType | Nil

    @[JSON::Field(key: "SourceLocation")]
    property source_location : String | Nil

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
  end
end
