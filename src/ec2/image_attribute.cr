private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an image attribute.
  class ImageAttribute
    # A description for the AMI.
    property description : AttributeValue | Nil

    # The kernel ID.
    property kernel_id : AttributeValue | Nil

    # The RAM disk ID.
    property ramdisk_id : AttributeValue | Nil

    # Indicates whether enhanced networking with the Intel 82599 Virtual Function interface is
    # enabled.
    property sriov_net_support : AttributeValue | Nil

    # The boot mode.
    property boot_mode : AttributeValue | Nil

    # If the image is configured for NitroTPM support, the value is `v2.0`.
    property tpm_support : AttributeValue | Nil

    # Base64 representation of the non-volatile UEFI variable store. To retrieve the UEFI data, use
    # the
    # [GetInstanceUefiData](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_GetInstanceUefiData)
    # command. You can inspect and modify the UEFI data by using the [python-uefivars
    # tool](https://github.com/awslabs/python-uefivars) on GitHub. For more information, see [UEFI
    # Secure Boot for Amazon EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/uefi-secure-boot.html) in the
    # *Amazon EC2 User Guide*.
    property uefi_data : AttributeValue | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the AMI
    # was last used to launch an EC2 instance. When the AMI is used to launch an instance, there is a
    # 24-hour delay before that usage is reported.
    #
    # `lastLaunchedTime` data is available starting April 2017.
    property last_launched_time : AttributeValue | Nil

    # If `v2.0`, it indicates that IMDSv2 is specified in the AMI. Instances launched from this AMI
    # will have `HttpTokens` automatically set to `required` so that, by default, the instance
    # requires that IMDSv2 is used when requesting instance metadata. In addition,
    # `HttpPutResponseHopLimit` is set to `2`. For more information, see [Configure the
    # AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#configure-IMDS-new-instances-ami-configuration)
    # in the *Amazon EC2 User Guide*.
    property imds_support : AttributeValue | Nil

    # Indicates whether deregistration protection is enabled for the AMI.
    property deregistration_protection : AttributeValue | Nil

    # The ID of the AMI.
    property image_id : String | Nil

    # The launch permissions.
    property launch_permissions : Array(LaunchPermission) | Nil

    # The product codes.
    property product_codes : Array(ProductCode) | Nil

    # The block device mapping entries.
    property block_device_mappings : Array(BlockDeviceMapping) | Nil

    def initialize(
      @description : AttributeValue | Nil = nil,
      @kernel_id : AttributeValue | Nil = nil,
      @ramdisk_id : AttributeValue | Nil = nil,
      @sriov_net_support : AttributeValue | Nil = nil,
      @boot_mode : AttributeValue | Nil = nil,
      @tpm_support : AttributeValue | Nil = nil,
      @uefi_data : AttributeValue | Nil = nil,
      @last_launched_time : AttributeValue | Nil = nil,
      @imds_support : AttributeValue | Nil = nil,
      @deregistration_protection : AttributeValue | Nil = nil,
      @image_id : String | Nil = nil,
      @launch_permissions : Array(LaunchPermission) | Nil = nil,
      @product_codes : Array(ProductCode) | Nil = nil,
      @block_device_mappings : Array(BlockDeviceMapping) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params.concat(value.to_query_params("#{prefix}Description."))
      end

      if value = @kernel_id
        params.concat(value.to_query_params("#{prefix}Kernel."))
      end

      if value = @ramdisk_id
        params.concat(value.to_query_params("#{prefix}Ramdisk."))
      end

      if value = @sriov_net_support
        params.concat(value.to_query_params("#{prefix}SriovNetSupport."))
      end

      if value = @boot_mode
        params.concat(value.to_query_params("#{prefix}BootMode."))
      end

      if value = @tpm_support
        params.concat(value.to_query_params("#{prefix}TpmSupport."))
      end

      if value = @uefi_data
        params.concat(value.to_query_params("#{prefix}UefiData."))
      end

      if value = @last_launched_time
        params.concat(value.to_query_params("#{prefix}LastLaunchedTime."))
      end

      if value = @imds_support
        params.concat(value.to_query_params("#{prefix}ImdsSupport."))
      end

      if value = @deregistration_protection
        params.concat(value.to_query_params("#{prefix}DeregistrationProtection."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      (@launch_permissions || [] of LaunchPermission).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchPermission.#{i}."))
      end

      (@product_codes || [] of ProductCode).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ProductCodes.#{i}."))
      end

      (@block_device_mappings || [] of BlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: node.xpath_node("*[local-name()='description']").try { |n| AttributeValue.from_xml(n) },
        kernel_id: node.xpath_node("*[local-name()='kernel']").try { |n| AttributeValue.from_xml(n) },
        ramdisk_id: node.xpath_node("*[local-name()='ramdisk']").try { |n| AttributeValue.from_xml(n) },
        sriov_net_support: node.xpath_node("*[local-name()='sriovNetSupport']").try { |n| AttributeValue.from_xml(n) },
        boot_mode: node.xpath_node("*[local-name()='bootMode']").try { |n| AttributeValue.from_xml(n) },
        tpm_support: node.xpath_node("*[local-name()='tpmSupport']").try { |n| AttributeValue.from_xml(n) },
        uefi_data: node.xpath_node("*[local-name()='uefiData']").try { |n| AttributeValue.from_xml(n) },
        last_launched_time: node.xpath_node("*[local-name()='lastLaunchedTime']").try { |n| AttributeValue.from_xml(n) },
        imds_support: node.xpath_node("*[local-name()='imdsSupport']").try { |n| AttributeValue.from_xml(n) },
        deregistration_protection: node.xpath_node("*[local-name()='deregistrationProtection']").try { |n| AttributeValue.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        launch_permissions: node.xpath_nodes("*[local-name()='launchPermission']/*[local-name()='item']").map { |n| LaunchPermission.from_xml(n) },
        product_codes: node.xpath_nodes("*[local-name()='productCodes']/*[local-name()='item']").map { |n| ProductCode.from_xml(n) },
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMapping']/*[local-name()='item']").map { |n| BlockDeviceMapping.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @description
        value.validate!
      end

      if value = @kernel_id
        value.validate!
      end

      if value = @ramdisk_id
        value.validate!
      end

      if value = @sriov_net_support
        value.validate!
      end

      if value = @boot_mode
        value.validate!
      end

      if value = @tpm_support
        value.validate!
      end

      if value = @uefi_data
        value.validate!
      end

      if value = @last_launched_time
        value.validate!
      end

      if value = @imds_support
        value.validate!
      end

      if value = @deregistration_protection
        value.validate!
      end

      if value = @launch_permissions
        value.each(&.validate!)
      end

      if value = @product_codes
        value.each(&.validate!)
      end

      if value = @block_device_mappings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @kernel_id, @ramdisk_id, @sriov_net_support, @boot_mode, @tpm_support, @uefi_data, @last_launched_time, @imds_support, @deregistration_protection, @image_id, @launch_permissions, @product_codes, @block_device_mappings)
  end
end
