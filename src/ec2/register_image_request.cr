private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for RegisterImage.
  class RegisterImageRequest
    # The full path to your AMI manifest in Amazon S3 storage. The specified bucket must have the
    # `aws-exec-read` canned access control list (ACL) to ensure that it can be accessed by Amazon
    # EC2. For more information, see [Canned
    # ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl) in the
    # *Amazon S3 Service Developer Guide*.
    property image_location : String | Nil

    # The billing product codes. Your account must be authorized to specify billing product codes.
    #
    # If your account is not authorized to specify billing product codes, you can publish AMIs that
    # include billable software and list them on the Amazon Web Services Marketplace. You must first
    # register as a seller on the Amazon Web Services Marketplace. For more information, see [Getting
    # started as an Amazon Web Services Marketplace
    # seller](https://docs.aws.amazon.com/marketplace/latest/userguide/user-guide-for-sellers.html)
    # and [AMI-based products in Amazon Web Services
    # Marketplace](https://docs.aws.amazon.com/marketplace/latest/userguide/ami-products.html) in the
    # *Amazon Web Services Marketplace Seller Guide*.
    property billing_products : Array(String) | Nil

    # The boot mode of the AMI. A value of `uefi-preferred` indicates that the AMI supports both UEFI
    # and Legacy BIOS.
    #
    # The operating system contained in the AMI must be configured to support the specified boot mode.
    #
    # For more information, see [Instance launch behavior with Amazon EC2 boot
    # modes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-boot.html) in the *Amazon EC2
    # User Guide*.
    property boot_mode : BootModeValues | Nil

    # Set to `v2.0` to enable Trusted Platform Module (TPM) support. For more information, see
    # [NitroTPM](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitrotpm.html) in the *Amazon EC2
    # User Guide*.
    property tpm_support : TpmSupportValues | Nil

    # Base64 representation of the non-volatile UEFI variable store. To retrieve the UEFI data, use
    # the
    # [GetInstanceUefiData](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_GetInstanceUefiData)
    # command. You can inspect and modify the UEFI data by using the [python-uefivars
    # tool](https://github.com/awslabs/python-uefivars) on GitHub. For more information, see [UEFI
    # Secure Boot for Amazon EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/uefi-secure-boot.html) in the
    # *Amazon EC2 User Guide*.
    property uefi_data : String | Nil

    # Set to `v2.0` to indicate that IMDSv2 is specified in the AMI. Instances launched from this AMI
    # will have `HttpTokens` automatically set to `required` so that, by default, the instance
    # requires that IMDSv2 is used when requesting instance metadata. In addition,
    # `HttpPutResponseHopLimit` is set to `2`. For more information, see [Configure the
    # AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#configure-IMDS-new-instances-ami-configuration)
    # in the *Amazon EC2 User Guide*.
    #
    # If you set the value to `v2.0`, make sure that your AMI software can support IMDSv2.
    property imds_support : ImdsSupportValues | Nil

    # The tags to apply to the AMI.
    #
    # To tag the AMI, the value for `ResourceType` must be `image`. If you specify another value for
    # `ResourceType`, the request fails.
    #
    # To tag an AMI after it has been registered, see
    # [CreateTags](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTags.html).
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A name for your AMI.
    #
    # Constraints: 3-128 alphanumeric characters, parentheses (()), square brackets ([]), spaces ( ),
    # periods (.), slashes (/), dashes (-), single quotes ('), at-signs (@), or underscores(_)
    property name : String

    # A description for your AMI.
    property description : String | Nil

    # The architecture of the AMI.
    #
    # Default: For Amazon EBS-backed AMIs, `i386`. For instance store-backed AMIs, the architecture
    # specified in the manifest file.
    property architecture : ArchitectureValues | Nil

    # The ID of the kernel.
    property kernel_id : String | Nil

    # The ID of the RAM disk.
    property ramdisk_id : String | Nil

    # The device name of the root device volume (for example, `/dev/sda1`).
    property root_device_name : String | Nil

    # The block device mapping entries.
    #
    # If you specify an Amazon EBS volume using the ID of an Amazon EBS snapshot, you can't specify
    # the encryption state of the volume.
    #
    # If you create an AMI on an Outpost, then all backing snapshots must be on the same Outpost or in
    # the Region of that Outpost. AMIs on an Outpost that include local snapshots can be used to
    # launch instances on the same Outpost only. For more information, [Create AMIs from local
    # snapshots](https://docs.aws.amazon.com/ebs/latest/userguide/snapshots-outposts.html#ami) in the
    # *Amazon EBS User Guide*.
    property block_device_mappings : Array(BlockDeviceMapping) | Nil

    # The type of virtualization (`hvm` | `paravirtual`).
    #
    # Default: `paravirtual`
    property virtualization_type : String | Nil

    # Set to `simple` to enable enhanced networking with the Intel 82599 Virtual Function interface
    # for the AMI and any instances that you launch from the AMI.
    #
    # There is no way to disable `sriovNetSupport` at this time.
    #
    # This option is supported only for HVM AMIs. Specifying this option with a PV AMI can make
    # instances launched from the AMI unreachable.
    property sriov_net_support : String | Nil

    # Set to `true` to enable enhanced networking with ENA for the AMI and any instances that you
    # launch from the AMI.
    #
    # This option is supported only for HVM AMIs. Specifying this option with a PV AMI can make
    # instances launched from the AMI unreachable.
    property ena_support : Bool | Nil

    def initialize(
      @name : String,
      @image_location : String | Nil = nil,
      @billing_products : Array(String) | Nil = nil,
      @boot_mode : BootModeValues | Nil = nil,
      @tpm_support : TpmSupportValues | Nil = nil,
      @uefi_data : String | Nil = nil,
      @imds_support : ImdsSupportValues | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @architecture : ArchitectureValues | Nil = nil,
      @kernel_id : String | Nil = nil,
      @ramdisk_id : String | Nil = nil,
      @root_device_name : String | Nil = nil,
      @block_device_mappings : Array(BlockDeviceMapping) | Nil = nil,
      @virtualization_type : String | Nil = nil,
      @sriov_net_support : String | Nil = nil,
      @ena_support : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_location
        params << {"#{prefix}ImageLocation", value}
      end

      (@billing_products || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}BillingProduct.#{i}", item}
      end

      if value = @boot_mode
        params << {"#{prefix}BootMode", value.to_json_object_key}
      end

      if value = @tpm_support
        params << {"#{prefix}TpmSupport", value.to_json_object_key}
      end

      if value = @uefi_data
        params << {"#{prefix}UefiData", value}
      end

      if value = @imds_support
        params << {"#{prefix}ImdsSupport", value.to_json_object_key}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}Name", @name}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @architecture
        params << {"#{prefix}Architecture", value.to_json_object_key}
      end

      if value = @kernel_id
        params << {"#{prefix}KernelId", value}
      end

      if value = @ramdisk_id
        params << {"#{prefix}RamdiskId", value}
      end

      if value = @root_device_name
        params << {"#{prefix}RootDeviceName", value}
      end

      (@block_device_mappings || [] of BlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end

      if value = @virtualization_type
        params << {"#{prefix}VirtualizationType", value}
      end

      if value = @sriov_net_support
        params << {"#{prefix}SriovNetSupport", value}
      end

      if value = @ena_support
        params << {"#{prefix}EnaSupport", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_location: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageLocation']")),
        billing_products: node.xpath_nodes("*[local-name()='BillingProduct']/*[local-name()='item']").map { |n| n.content },
        boot_mode: (n = node.xpath_node("*[local-name()='BootMode']")) ? AEC::BootModeValues.from_json_object_key?(n.content) : nil,
        tpm_support: (n = node.xpath_node("*[local-name()='TpmSupport']")) ? AEC::TpmSupportValues.from_json_object_key?(n.content) : nil,
        uefi_data: Core::XMLValue.string(node.xpath_node("*[local-name()='UefiData']")),
        imds_support: (n = node.xpath_node("*[local-name()='ImdsSupport']")) ? AEC::ImdsSupportValues.from_json_object_key?(n.content) : nil,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        architecture: (n = node.xpath_node("*[local-name()='architecture']")) ? AEC::ArchitectureValues.from_json_object_key?(n.content) : nil,
        kernel_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kernelId']")),
        ramdisk_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ramdiskId']")),
        root_device_name: Core::XMLValue.string(node.xpath_node("*[local-name()='rootDeviceName']")),
        block_device_mappings: node.xpath_nodes("*[local-name()='BlockDeviceMapping']/*[local-name()='BlockDeviceMapping']").map { |n| BlockDeviceMapping.from_xml(n) },
        virtualization_type: Core::XMLValue.string(node.xpath_node("*[local-name()='virtualizationType']")),
        sriov_net_support: Core::XMLValue.string(node.xpath_node("*[local-name()='sriovNetSupport']")),
        ena_support: Core::XMLValue.bool(node.xpath_node("*[local-name()='enaSupport']")),
      )
    end

    def validate! : Nil
      if value = @uefi_data
        raise Core::ValidationError.new("UefiData length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("UefiData length must be <= 64000") if value.size > 64000
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 255") if value.size > 255
      end

      if value = @block_device_mappings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_location, @billing_products, @boot_mode, @tpm_support, @uefi_data, @imds_support, @tag_specifications, @dry_run, @name, @description, @architecture, @kernel_id, @ramdisk_id, @root_device_name, @block_device_mappings, @virtualization_type, @sriov_net_support, @ena_support)
  end
end
