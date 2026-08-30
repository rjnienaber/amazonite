private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes a filter for a specific list of managed nodes.
  class InstanceInformation
    include JSON::Serializable

    # The managed node ID.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # Connection status of SSM Agent.
    #
    # The status `Inactive` has been deprecated and is no longer in use.
    @[JSON::Field(key: "PingStatus", converter: AS::PingStatus)]
    property ping_status : PingStatus | Nil

    # The date and time when the agent last pinged the Systems Manager service.
    @[JSON::Field(key: "LastPingDateTime", converter: Core::AWSEpochConverter)]
    property last_ping_date_time : Time | Nil

    # The version of SSM Agent running on your Linux managed node.
    @[JSON::Field(key: "AgentVersion")]
    property agent_version : String | Nil

    # Indicates whether the latest version of SSM Agent is running on your Linux managed node. This
    # field doesn't indicate whether or not the latest version is installed on Windows managed nodes,
    # because some older versions of Windows Server use the EC2Config service to process Systems
    # Manager requests.
    @[JSON::Field(key: "IsLatestVersion")]
    property is_latest_version : Bool | Nil

    # The operating system platform type.
    @[JSON::Field(key: "PlatformType", converter: AS::PlatformType)]
    property platform_type : PlatformType | Nil

    # The name of the operating system platform running on your managed node.
    @[JSON::Field(key: "PlatformName")]
    property platform_name : String | Nil

    # The version of the OS platform running on your managed node.
    @[JSON::Field(key: "PlatformVersion")]
    property platform_version : String | Nil

    # The activation ID created by Amazon Web Services Systems Manager when the server or virtual
    # machine (VM) was registered.
    @[JSON::Field(key: "ActivationId")]
    property activation_id : String | Nil

    # The role assigned to an Amazon EC2 instance configured with a Systems Manager Quick Setup host
    # management configuration or the role assigned to an on-premises managed node.
    #
    # This call doesn't return the IAM role for *unmanaged* Amazon EC2 instances (instances not
    # configured for Systems Manager). To retrieve the role for an unmanaged instance, use the Amazon
    # EC2 `DescribeInstances` operation. For information, see
    # [DescribeInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html)
    # in the *Amazon EC2 API Reference* or
    # [describe-instances](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html)
    # in the *Amazon Web Services CLI Command Reference*.
    @[JSON::Field(key: "IamRole")]
    property iam_role : String | Nil

    # The date the server or VM was registered with Amazon Web Services as a managed node.
    @[JSON::Field(key: "RegistrationDate", converter: Core::AWSEpochConverter)]
    property registration_date : Time | Nil

    # The type of instance. Instances are either EC2 instances or managed instances.
    @[JSON::Field(key: "ResourceType", converter: AS::ResourceType)]
    property resource_type : ResourceType | Nil

    # The name assigned to an on-premises server, edge device, or virtual machine (VM) when it is
    # activated as a Systems Manager managed node. The name is specified as the `DefaultInstanceName`
    # property using the CreateActivation command. It is applied to the managed node by specifying the
    # Activation Code and Activation ID when you install SSM Agent on the node, as explained in [How
    # to install SSM Agent on hybrid Linux
    # nodes](https://docs.aws.amazon.com/systems-manager/latest/userguide/hybrid-multicloud-ssm-agent-install-linux.html)
    # and [How to install SSM Agent on hybrid Windows Server
    # nodes](https://docs.aws.amazon.com/systems-manager/latest/userguide/hybrid-multicloud-ssm-agent-install-windows.html).
    # To retrieve the `Name` tag of an EC2 instance, use the Amazon EC2 `DescribeInstances` operation.
    # For information, see
    # [DescribeInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html)
    # in the *Amazon EC2 API Reference* or
    # [describe-instances](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html)
    # in the *Amazon Web Services CLI Command Reference*.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The IP address of the managed node.
    @[JSON::Field(key: "IPAddress")]
    property ip_address : String | Nil

    # The fully qualified host name of the managed node.
    @[JSON::Field(key: "ComputerName")]
    property computer_name : String | Nil

    # The status of the association.
    @[JSON::Field(key: "AssociationStatus")]
    property association_status : String | Nil

    # The date the association was last run.
    @[JSON::Field(key: "LastAssociationExecutionDate", converter: Core::AWSEpochConverter)]
    property last_association_execution_date : Time | Nil

    # The last date the association was successfully run.
    @[JSON::Field(key: "LastSuccessfulAssociationExecutionDate", converter: Core::AWSEpochConverter)]
    property last_successful_association_execution_date : Time | Nil

    # Information about the association.
    @[JSON::Field(key: "AssociationOverview")]
    property association_overview : InstanceAggregatedAssociationOverview | Nil

    # The ID of the source resource. For IoT Greengrass devices, `SourceId` is the Thing name.
    @[JSON::Field(key: "SourceId")]
    property source_id : String | Nil

    # The type of the source resource. For IoT Greengrass devices, `SourceType` is `AWS::IoT::Thing`.
    # For Azure Virtual Machines, `SourceType` is `Microsoft.Compute/virtualMachines`.
    @[JSON::Field(key: "SourceType", converter: AS::SourceType)]
    property source_type : SourceType | Nil

    # The location of the source resource in the third-party cloud environment.
    @[JSON::Field(key: "SourceLocation")]
    property source_location : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @ping_status : PingStatus | Nil = nil,
      @last_ping_date_time : Time | Nil = nil,
      @agent_version : String | Nil = nil,
      @is_latest_version : Bool | Nil = nil,
      @platform_type : PlatformType | Nil = nil,
      @platform_name : String | Nil = nil,
      @platform_version : String | Nil = nil,
      @activation_id : String | Nil = nil,
      @iam_role : String | Nil = nil,
      @registration_date : Time | Nil = nil,
      @resource_type : ResourceType | Nil = nil,
      @name : String | Nil = nil,
      @ip_address : String | Nil = nil,
      @computer_name : String | Nil = nil,
      @association_status : String | Nil = nil,
      @last_association_execution_date : Time | Nil = nil,
      @last_successful_association_execution_date : Time | Nil = nil,
      @association_overview : InstanceAggregatedAssociationOverview | Nil = nil,
      @source_id : String | Nil = nil,
      @source_type : SourceType | Nil = nil,
      @source_location : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @agent_version
        raise Core::ValidationError.new("AgentVersion does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{1,6}(\\.[0-9]{1,6}){2,3}$"))
      end

      if value = @activation_id
        raise Core::ValidationError.new("ActivationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end

      if value = @iam_role
        raise Core::ValidationError.new("IamRole length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("IamRole length must be <= 64") if value.size > 64
      end

      if value = @ip_address
        raise Core::ValidationError.new("IPAddress length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IPAddress length must be <= 46") if value.size > 46
      end

      if value = @computer_name
        raise Core::ValidationError.new("ComputerName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ComputerName length must be <= 255") if value.size > 255
      end

      if value = @association_overview
        value.validate!
      end

      if value = @source_id
        raise Core::ValidationError.new("SourceId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SourceId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("SourceId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:_-]*$"))
      end

      if value = @source_location
        raise Core::ValidationError.new("SourceLocation length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SourceLocation length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("SourceLocation does not match the required pattern") unless value.matches?(Regex.new("^.{1,128}$"))
      end
    end

    def_equals_and_hash(@instance_id, @ping_status, @last_ping_date_time, @agent_version, @is_latest_version, @platform_type, @platform_name, @platform_version, @activation_id, @iam_role, @registration_date, @resource_type, @name, @ip_address, @computer_name, @association_status, @last_association_execution_date, @last_successful_association_execution_date, @association_overview, @source_id, @source_type, @source_location)
  end
end
