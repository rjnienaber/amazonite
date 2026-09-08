private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an image.
  class Image
    # The platform details associated with the billing code of the AMI. For more information, see
    # [Understand AMI billing
    # information](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-billing-info.html) in the
    # *Amazon EC2 User Guide*.
    property platform_details : String | Nil

    # The operation of the Amazon EC2 instance and the billing code that is associated with the AMI.
    # `usageOperation` corresponds to the
    # [lineitem/Operation](https://docs.aws.amazon.com/cur/latest/userguide/Lineitem-columns.html#Lineitem-details-O-Operation)
    # column on your Amazon Web Services Cost and Usage Report and in the [Amazon Web Services Price
    # List API](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/price-changes.html). You
    # can view these fields on the **Instances** or **AMIs** pages in the Amazon EC2 console, or in
    # the responses that are returned by the
    # [DescribeImages](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeImages.html)
    # command in the Amazon EC2 API, or the
    # [describe-images](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html)
    # command in the CLI.
    property usage_operation : String | Nil

    # Any block device mapping entries.
    property block_device_mappings : Array(BlockDeviceMapping) | Nil

    # The description of the AMI that was provided during image creation.
    property description : String | Nil

    # Specifies whether enhanced networking with ENA is enabled.
    property ena_support : Bool | Nil

    # The hypervisor type of the image. Only `xen` is supported. `ovm` is not supported.
    property hypervisor : HypervisorType | Nil

    # The owner alias (`amazon` | `aws-backup-vault` | `aws-marketplace`).
    property image_owner_alias : String | Nil

    # The name of the AMI that was provided during image creation.
    property name : String | Nil

    # The device name of the root device volume (for example, `/dev/sda1`).
    property root_device_name : String | Nil

    # The type of root device used by the AMI. The AMI can use an Amazon EBS volume or an instance
    # store volume.
    property root_device_type : DeviceType | Nil

    # Specifies whether enhanced networking with the Intel 82599 Virtual Function interface is
    # enabled.
    property sriov_net_support : String | Nil

    # The reason for the state change.
    property state_reason : StateReason | Nil

    # Any tags assigned to the image.
    property tags : Array(Tag) | Nil

    # The type of virtualization of the AMI.
    property virtualization_type : VirtualizationType | Nil

    # The boot mode of the image. For more information, see [Instance launch behavior with Amazon EC2
    # boot modes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-boot.html) in the *Amazon
    # EC2 User Guide*.
    property boot_mode : BootModeValues | Nil

    # If the image is configured for NitroTPM support, the value is `v2.0`. For more information, see
    # [NitroTPM](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitrotpm.html) in the *Amazon EC2
    # User Guide*.
    property tpm_support : TpmSupportValues | Nil

    # The date and time to deprecate the AMI, in UTC, in the following format:
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z. If you specified a value for seconds, Amazon EC2 rounds the
    # seconds to the nearest minute.
    property deprecation_time : String | Nil

    # If `v2.0`, it indicates that IMDSv2 is specified in the AMI. Instances launched from this AMI
    # will have `HttpTokens` automatically set to `required` so that, by default, the instance
    # requires that IMDSv2 is used when requesting instance metadata. In addition,
    # `HttpPutResponseHopLimit` is set to `2`. For more information, see [Configure the
    # AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#configure-IMDS-new-instances-ami-configuration)
    # in the *Amazon EC2 User Guide*.
    property imds_support : ImdsSupportValues | Nil

    # The ID of the instance that the AMI was created from if the AMI was created using
    # [CreateImage](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateImage.html). This
    # field only appears if the AMI was created using CreateImage.
    property source_instance_id : String | Nil

    # Indicates whether deregistration protection is enabled for the AMI.
    property deregistration_protection : String | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the AMI
    # was last used to launch an EC2 instance. When the AMI is used to launch an instance, there is a
    # 24-hour delay before that usage is reported.
    #
    # `lastLaunchedTime` data is available starting April 2017.
    property last_launched_time : String | Nil

    # If `true`, the AMI satisfies the criteria for Allowed AMIs and can be discovered and used in the
    # account. If `false` and Allowed AMIs is set to `enabled`, the AMI can't be discovered or used in
    # the account. If `false` and Allowed AMIs is set to `audit-mode`, the AMI can be discovered and
    # used in the account.
    #
    # For more information, see [Control the discovery and use of AMIs in Amazon EC2 with Allowed
    # AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-allowed-amis.html) in *Amazon EC2
    # User Guide*.
    property image_allowed : Bool | Nil

    # The ID of the source AMI from which the AMI was created.
    property source_image_id : String | Nil

    # The Region of the source AMI.
    property source_image_region : String | Nil

    # Indicates whether the image is eligible for Amazon Web Services Free Tier.
    #
    # - If `true`, the AMI is eligible for Free Tier and can be used to launch instances under the
    # Free Tier limits.
    #
    # - If `false`, the AMI is not eligible for Free Tier.
    property free_tier_eligible : Bool | Nil

    # The name of the public Systems Manager parameter that resolves to this AMI, under the
    # `aws/service/` namespace.
    property public_ssm_parameter_name : String | Nil

    # The watermarks attached to the AMI.
    property image_watermarks : Array(ImageWatermark) | Nil

    # The instance type specification for the AMI, which defines which instance types are compatible
    # with this image.
    property instance_type_specification : InstanceTypeSpecification | Nil

    # The ID of the AMI.
    property image_id : String | Nil

    # The location of the AMI.
    property image_location : String | Nil

    # The current state of the AMI. If the state is `available`, the image is successfully registered
    # and can be used to launch an instance.
    property state : ImageState | Nil

    # The ID of the Amazon Web Services account that owns the image.
    property owner_id : String | Nil

    # The date and time the image was created.
    property creation_date : String | Nil

    # Indicates whether the image has public launch permissions. The value is `true` if this image has
    # public launch permissions or `false` if it has only implicit and explicit launch permissions.
    property public : Bool | Nil

    # Any product codes associated with the AMI.
    property product_codes : Array(ProductCode) | Nil

    # The architecture of the image.
    property architecture : ArchitectureValues | Nil

    # The type of image.
    property image_type : ImageTypeValues | Nil

    # The kernel associated with the image, if any. Only applicable for machine images.
    property kernel_id : String | Nil

    # The RAM disk associated with the image, if any. Only applicable for machine images.
    property ramdisk_id : String | Nil

    # This value is set to `windows` for Windows AMIs; otherwise, it is blank.
    property platform : PlatformValues | Nil

    def initialize(
      @platform_details : String | Nil = nil,
      @usage_operation : String | Nil = nil,
      @block_device_mappings : Array(BlockDeviceMapping) | Nil = nil,
      @description : String | Nil = nil,
      @ena_support : Bool | Nil = nil,
      @hypervisor : HypervisorType | Nil = nil,
      @image_owner_alias : String | Nil = nil,
      @name : String | Nil = nil,
      @root_device_name : String | Nil = nil,
      @root_device_type : DeviceType | Nil = nil,
      @sriov_net_support : String | Nil = nil,
      @state_reason : StateReason | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @virtualization_type : VirtualizationType | Nil = nil,
      @boot_mode : BootModeValues | Nil = nil,
      @tpm_support : TpmSupportValues | Nil = nil,
      @deprecation_time : String | Nil = nil,
      @imds_support : ImdsSupportValues | Nil = nil,
      @source_instance_id : String | Nil = nil,
      @deregistration_protection : String | Nil = nil,
      @last_launched_time : String | Nil = nil,
      @image_allowed : Bool | Nil = nil,
      @source_image_id : String | Nil = nil,
      @source_image_region : String | Nil = nil,
      @free_tier_eligible : Bool | Nil = nil,
      @public_ssm_parameter_name : String | Nil = nil,
      @image_watermarks : Array(ImageWatermark) | Nil = nil,
      @instance_type_specification : InstanceTypeSpecification | Nil = nil,
      @image_id : String | Nil = nil,
      @image_location : String | Nil = nil,
      @state : ImageState | Nil = nil,
      @owner_id : String | Nil = nil,
      @creation_date : String | Nil = nil,
      @public : Bool | Nil = nil,
      @product_codes : Array(ProductCode) | Nil = nil,
      @architecture : ArchitectureValues | Nil = nil,
      @image_type : ImageTypeValues | Nil = nil,
      @kernel_id : String | Nil = nil,
      @ramdisk_id : String | Nil = nil,
      @platform : PlatformValues | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @platform_details
        params << {"#{prefix}PlatformDetails", value}
      end

      if value = @usage_operation
        params << {"#{prefix}UsageOperation", value}
      end

      (@block_device_mappings || [] of BlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @ena_support
        params << {"#{prefix}EnaSupport", Core::QueryValue.bool(value)}
      end

      if value = @hypervisor
        params << {"#{prefix}Hypervisor", value.to_json_object_key}
      end

      if value = @image_owner_alias
        params << {"#{prefix}ImageOwnerAlias", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @root_device_name
        params << {"#{prefix}RootDeviceName", value}
      end

      if value = @root_device_type
        params << {"#{prefix}RootDeviceType", value.to_json_object_key}
      end

      if value = @sriov_net_support
        params << {"#{prefix}SriovNetSupport", value}
      end

      if value = @state_reason
        params.concat(value.to_query_params("#{prefix}StateReason."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @virtualization_type
        params << {"#{prefix}VirtualizationType", value.to_json_object_key}
      end

      if value = @boot_mode
        params << {"#{prefix}BootMode", value.to_json_object_key}
      end

      if value = @tpm_support
        params << {"#{prefix}TpmSupport", value.to_json_object_key}
      end

      if value = @deprecation_time
        params << {"#{prefix}DeprecationTime", value}
      end

      if value = @imds_support
        params << {"#{prefix}ImdsSupport", value.to_json_object_key}
      end

      if value = @source_instance_id
        params << {"#{prefix}SourceInstanceId", value}
      end

      if value = @deregistration_protection
        params << {"#{prefix}DeregistrationProtection", value}
      end

      if value = @last_launched_time
        params << {"#{prefix}LastLaunchedTime", value}
      end

      if value = @image_allowed
        params << {"#{prefix}ImageAllowed", Core::QueryValue.bool(value)}
      end

      if value = @source_image_id
        params << {"#{prefix}SourceImageId", value}
      end

      if value = @source_image_region
        params << {"#{prefix}SourceImageRegion", value}
      end

      if value = @free_tier_eligible
        params << {"#{prefix}FreeTierEligible", Core::QueryValue.bool(value)}
      end

      if value = @public_ssm_parameter_name
        params << {"#{prefix}PublicSsmParameterName", value}
      end

      (@image_watermarks || [] of ImageWatermark).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageWatermarkSet.#{i}."))
      end

      if value = @instance_type_specification
        params.concat(value.to_query_params("#{prefix}InstanceTypeSpecification."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @image_location
        params << {"#{prefix}ImageLocation", value}
      end

      if value = @state
        params << {"#{prefix}ImageState", value.to_json_object_key}
      end

      if value = @owner_id
        params << {"#{prefix}ImageOwnerId", value}
      end

      if value = @creation_date
        params << {"#{prefix}CreationDate", value}
      end

      if value = @public
        params << {"#{prefix}IsPublic", Core::QueryValue.bool(value)}
      end

      (@product_codes || [] of ProductCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProductCodes.#{i}."))
      end

      if value = @architecture
        params << {"#{prefix}Architecture", value.to_json_object_key}
      end

      if value = @image_type
        params << {"#{prefix}ImageType", value.to_json_object_key}
      end

      if value = @kernel_id
        params << {"#{prefix}KernelId", value}
      end

      if value = @ramdisk_id
        params << {"#{prefix}RamdiskId", value}
      end

      if value = @platform
        params << {"#{prefix}Platform", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        platform_details: Core::XMLValue.string(node.xpath_node("*[local-name()='platformDetails']")),
        usage_operation: Core::XMLValue.string(node.xpath_node("*[local-name()='usageOperation']")),
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMapping']/*[local-name()='item']").map { |n| BlockDeviceMapping.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        ena_support: Core::XMLValue.bool(node.xpath_node("*[local-name()='enaSupport']")),
        hypervisor: (n = node.xpath_node("*[local-name()='hypervisor']")) ? AEC::HypervisorType.from_json_object_key?(n.content) : nil,
        image_owner_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='imageOwnerAlias']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
        root_device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='rootDeviceName']")),
        root_device_type: (n = node.xpath_node("*[local-name()='rootDeviceType']")) ? AEC::DeviceType.from_json_object_key?(n.content) : nil,
        sriov_net_support: Core::XMLValue.string(node.xpath_node("*[local-name()='sriovNetSupport']")),
        state_reason: node.xpath_node("*[local-name()='stateReason']").try { |n| StateReason.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        virtualization_type: (n = node.xpath_node("*[local-name()='virtualizationType']")) ? AEC::VirtualizationType.from_json_object_key?(n.content) : nil,
        boot_mode: (n = node.xpath_node("*[local-name()='bootMode']")) ? AEC::BootModeValues.from_json_object_key?(n.content) : nil,
        tpm_support: (n = node.xpath_node("*[local-name()='tpmSupport']")) ? AEC::TpmSupportValues.from_json_object_key?(n.content) : nil,
        deprecation_time: Core::XMLValue.string(node.xpath_node("*[local-name()='deprecationTime']")),
        imds_support: (n = node.xpath_node("*[local-name()='imdsSupport']")) ? AEC::ImdsSupportValues.from_json_object_key?(n.content) : nil,
        source_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceInstanceId']")),
        deregistration_protection: Core::XMLValue.string(node.xpath_node("*[local-name()='deregistrationProtection']")),
        last_launched_time: Core::XMLValue.string(node.xpath_node("*[local-name()='lastLaunchedTime']")),
        image_allowed: Core::XMLValue.bool(node.xpath_node("*[local-name()='imageAllowed']")),
        source_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceImageId']")),
        source_image_region: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceImageRegion']")),
        free_tier_eligible: Core::XMLValue.bool(node.xpath_node("*[local-name()='freeTierEligible']")),
        public_ssm_parameter_name: Core::XMLValue.string(node.xpath_node("*[local-name()='publicSsmParameterName']")),
        image_watermarks: node.xpath_nodes("*[local-name()='imageWatermarkSet']/*[local-name()='item']").map { |n| ImageWatermark.from_xml(n) },
        instance_type_specification: node.xpath_node("*[local-name()='instanceTypeSpecification']").try { |n| InstanceTypeSpecification.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        image_location: Core::XMLValue.string(node.xpath_node("*[local-name()='imageLocation']")),
        state: (n = node.xpath_node("*[local-name()='imageState']")) ? AEC::ImageState.from_json_object_key?(n.content) : nil,
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageOwnerId']")),
        creation_date: Core::XMLValue.string(node.xpath_node("*[local-name()='creationDate']")),
        public: Core::XMLValue.bool(node.xpath_node("*[local-name()='isPublic']")),
        product_codes: node.xpath_nodes("*[local-name()='productCodes']/*[local-name()='item']").map { |n| ProductCode.from_xml(n) },
        architecture: (n = node.xpath_node("*[local-name()='architecture']")) ? AEC::ArchitectureValues.from_json_object_key?(n.content) : nil,
        image_type: (n = node.xpath_node("*[local-name()='imageType']")) ? AEC::ImageTypeValues.from_json_object_key?(n.content) : nil,
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kernelId']")),
        ramdisk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ramdiskId']")),
        platform: (n = node.xpath_node("*[local-name()='platform']")) ? AEC::PlatformValues.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @block_device_mappings
        value.each(&.validate!)
      end

      if value = @state_reason
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @image_watermarks
        value.each(&.validate!)
      end

      if value = @instance_type_specification
        value.validate!
      end

      if value = @product_codes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@platform_details, @usage_operation, @block_device_mappings, @description, @ena_support, @hypervisor, @image_owner_alias, @name, @root_device_name, @root_device_type, @sriov_net_support, @state_reason, @tags, @virtualization_type, @boot_mode, @tpm_support, @deprecation_time, @imds_support, @source_instance_id, @deregistration_protection, @last_launched_time, @image_allowed, @source_image_id, @source_image_region, @free_tier_eligible, @public_ssm_parameter_name, @image_watermarks, @instance_type_specification, @image_id, @image_location, @state, @owner_id, @creation_date, @public, @product_codes, @architecture, @image_type, @kernel_id, @ramdisk_id, @platform)
  end
end
