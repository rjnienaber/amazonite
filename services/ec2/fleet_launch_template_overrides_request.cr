private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes overrides for a launch template.
  class FleetLaunchTemplateOverridesRequest
    # The instance type.
    #
    # `mac1.metal` is not supported as a launch template override.
    #
    # If you specify `InstanceType`, you can't specify `InstanceRequirements`.
    property instance_type : InstanceType | Nil

    # The maximum price per unit hour that you are willing to pay for a Spot Instance. We do not
    # recommend using this parameter because it can lead to increased interruptions. If you do not
    # specify this parameter, you will pay the current Spot price.
    #
    # If you specify a maximum price, your instances will be interrupted more frequently than if you
    # do not specify this parameter.
    #
    # If you specify a maximum price, it must be more than USD $0.001. Specifying a value below USD
    # $0.001 will result in an `InvalidParameterValue` error message.
    property max_price : String | Nil

    # The IDs of the subnets in which to launch the instances. Separate multiple subnet IDs using
    # commas (for example, `subnet-1234abcdeexample1, subnet-0987cdef6example2`). A request of type
    # `instant` can have only one subnet ID.
    property subnet_id : String | Nil

    # The Availability Zone in which to launch the instances. For example, `us-east-2a`.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified in the request, but not
    # both.
    property availability_zone : String | Nil

    # The number of units provided by the specified instance type. These are the same units that you
    # chose to set the target capacity in terms of instances, or a performance characteristic such as
    # vCPUs, memory, or I/O.
    #
    # If the target capacity divided by this value is not a whole number, Amazon EC2 rounds the number
    # of instances to the next whole number. If this value is not specified, the default is 1.
    #
    # When specifying weights, the price used in the `lowest-price` and `price-capacity-optimized`
    # allocation strategies is per *unit* hour (where the instance price is divided by the specified
    # weight). However, if all the specified weights are above the requested `TargetCapacity`,
    # resulting in only 1 instance being launched, the price used is per *instance* hour.
    property weighted_capacity : Float64 | Nil

    # The priority for the launch template override. The highest priority is launched first.
    #
    # If the On-Demand `AllocationStrategy` is set to `prioritized`, EC2 Fleet uses priority to
    # determine which launch template override to use first in fulfilling On-Demand capacity.
    #
    # If the Spot `AllocationStrategy` is set to `capacity-optimized-prioritized`, EC2 Fleet uses
    # priority on a best-effort basis to determine which launch template override to use in fulfilling
    # Spot capacity, but optimizes for capacity first.
    #
    # Valid values are whole numbers starting at `0`. The lower the number, the higher the priority.
    # If no number is set, the launch template override has the lowest priority. You can set the same
    # priority for different launch template overrides.
    property priority : Float64 | Nil

    # The location where the instance launched, if applicable.
    property placement : Placement | Nil

    # The name of the key pair to use for the instances.
    #
    # Supported only for fleets of type `instant`.
    #
    # For more information, see [Amazon EC2 key
    # pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) in the *Amazon
    # EC2 User Guide*.
    property key_name : String | Nil

    # The block device mappings, which define the EBS volumes and instance store volumes to attach to
    # the instance at launch.
    #
    # Supported only for fleets of type `instant`.
    #
    # For more information, see [Block device mappings for volumes on Amazon EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html)
    # in the *Amazon EC2 User Guide*.
    property block_device_mappings : Array(FleetBlockDeviceMappingRequest) | Nil

    # The IAM instance profile to associate with the instances.
    #
    # Supported only for fleets of type `instant`.
    #
    # For more information, see [IAM roles for Amazon
    # EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html) in the
    # *Amazon EC2 User Guide*.
    property iam_instance_profile : FleetIamInstanceProfileSpecificationRequest | Nil

    # The metadata options for the instances.
    #
    # Supported only for fleets of type `instant`.
    #
    # For more information, see [Configure the instance metadata
    # service](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html)
    # in the *Amazon EC2 User Guide*.
    property metadata_options : FleetInstanceMetadataOptionsRequest | Nil

    # The attributes for the instance types. When you specify instance attributes, Amazon EC2 will
    # identify instance types with those attributes.
    #
    # If you specify `InstanceRequirements`, you can't specify `InstanceType`.
    property instance_requirements : InstanceRequirementsRequest | Nil

    # The ID of the AMI in the format `ami-17characters00000`.
    #
    # Alternatively, you can specify a Systems Manager parameter, using one of the following formats.
    # The Systems Manager parameter will resolve to an AMI ID on launch.
    #
    # To reference a public parameter:
    #
    # - `resolve:ssm:*public-parameter* `
    #
    # To reference a parameter stored in the same account:
    #
    # - `resolve:ssm:*parameter-name* `
    #
    # - `resolve:ssm:*parameter-name:version-number* `
    #
    # - `resolve:ssm:*parameter-name:label* `
    #
    # To reference a parameter shared from another Amazon Web Services account:
    #
    # - `resolve:ssm:*parameter-ARN* `
    #
    # - `resolve:ssm:*parameter-ARN:version-number* `
    #
    # - `resolve:ssm:*parameter-ARN:label* `
    #
    # For more information, see [Use a Systems Manager parameter instead of an AMI
    # ID](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-launch-template.html#use-an-ssm-parameter-instead-of-an-ami-id)
    # in the *Amazon EC2 User Guide*.
    #
    # This parameter is only available for fleets of type `instant`. For fleets of type `maintain` and
    # `request`, you must specify the AMI ID in the launch template.
    property image_id : String | Nil

    # The ID of the Availability Zone in which to launch the instances. For example, `use2-az1`.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified in the request, but not
    # both.
    property availability_zone_id : String | Nil

    def initialize(
      @instance_type : InstanceType | Nil = nil,
      @max_price : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @weighted_capacity : Float64 | Nil = nil,
      @priority : Float64 | Nil = nil,
      @placement : Placement | Nil = nil,
      @key_name : String | Nil = nil,
      @block_device_mappings : Array(FleetBlockDeviceMappingRequest) | Nil = nil,
      @iam_instance_profile : FleetIamInstanceProfileSpecificationRequest | Nil = nil,
      @metadata_options : FleetInstanceMetadataOptionsRequest | Nil = nil,
      @instance_requirements : InstanceRequirementsRequest | Nil = nil,
      @image_id : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value.to_json_object_key}
      end

      if value = @max_price
        params << {"#{prefix}MaxPrice", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @weighted_capacity
        params << {"#{prefix}WeightedCapacity", value.to_s}
      end

      if value = @priority
        params << {"#{prefix}Priority", value.to_s}
      end

      if value = @placement
        params.concat(value.to_query_params("#{prefix}Placement."))
      end

      if value = @key_name
        params << {"#{prefix}KeyName", value}
      end

      (@block_device_mappings || [] of FleetBlockDeviceMappingRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @iam_instance_profile
        params.concat(value.to_query_params("#{prefix}IamInstanceProfile."))
      end

      if value = @metadata_options
        params.concat(value.to_query_params("#{prefix}MetadataOptions."))
      end

      if value = @instance_requirements
        params.concat(value.to_query_params("#{prefix}InstanceRequirements."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_type: (n = node.xpath_node("*[local-name()='InstanceType']")) ? AEC::InstanceType.from_json_object_key?(n.content) : nil,
        max_price: Core::XMLValue.string(node.xpath_node("*[local-name()='MaxPrice']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        weighted_capacity: Core::XMLValue.f64(node.xpath_node("*[local-name()='WeightedCapacity']")),
        priority: Core::XMLValue.f64(node.xpath_node("*[local-name()='Priority']")),
        placement: node.xpath_node("*[local-name()='Placement']").try { |n| Placement.from_xml(n) },
        key_name: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyName']")),
        block_device_mappings: node.xpath_nodes("*[local-name()='BlockDeviceMapping']/*[local-name()='BlockDeviceMapping']").map { |n| FleetBlockDeviceMappingRequest.from_xml(n) },
        iam_instance_profile: node.xpath_node("*[local-name()='IamInstanceProfile']").try { |n| FleetIamInstanceProfileSpecificationRequest.from_xml(n) },
        metadata_options: node.xpath_node("*[local-name()='MetadataOptions']").try { |n| FleetInstanceMetadataOptionsRequest.from_xml(n) },
        instance_requirements: node.xpath_node("*[local-name()='InstanceRequirements']").try { |n| InstanceRequirementsRequest.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
      )
    end

    def validate! : Nil
      if value = @placement
        value.validate!
      end

      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @iam_instance_profile
        value.validate!
      end

      if value = @metadata_options
        value.validate!
      end

      if value = @instance_requirements
        value.validate!
      end
    end

    def_equals_and_hash(@instance_type, @max_price, @subnet_id, @availability_zone, @weighted_capacity, @priority, @placement, @key_name, @block_device_mappings, @iam_instance_profile, @metadata_options, @instance_requirements, @image_id, @availability_zone_id)
  end
end
