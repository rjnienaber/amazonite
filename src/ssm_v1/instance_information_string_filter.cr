module Amazonite::SsmV1
  # The filters to describe or get information about your managed nodes.
  class InstanceInformationStringFilter
    include JSON::Serializable

    # The filter key name to describe your managed nodes.
    #
    # Valid filter key values: ActivationIds | AgentVersion | AssociationStatus | IamRole |
    # InstanceIds | PingStatus | PlatformTypes | ResourceType | SourceIds | SourceTypes | "tag-key" |
    # "tag:`{keyname}`
    #
    # - Valid values for the `AssociationStatus` filter key: Success | Pending | Failed
    #
    # - Valid values for the `PingStatus` filter key: Online | ConnectionLost | Inactive (deprecated)
    #
    # - Valid values for the `PlatformTypes` filter key: Windows | Linux | MacOS
    #
    # - Valid values for the `ResourceType` filter key: EC2Instance | ManagedInstance
    #
    # - Valid values for the `SourceType` filter key: AWS::EC2::Instance | AWS::SSM::ManagedInstance |
    # AWS::IoT::Thing | Microsoft.Compute/virtualMachines
    #
    # - Valid tag examples: `Key=tag-key,Values=Purpose` | `Key=tag:Purpose,Values=Test`.
    @[JSON::Field(key: "Key")]
    property key : String

    # The filter values.
    @[JSON::Field(key: "Values")]
    property values : Array(String) = [] of String

    def initialize(
      @key : String,
      @values : Array(String),
    )
    end
  end
end
