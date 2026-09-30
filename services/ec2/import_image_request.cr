private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ImportImageRequest
    # The architecture of the virtual machine.
    #
    # Valid values: `i386` | `x86_64`
    property architecture : String | Nil

    # The client-specific data.
    property client_data : ClientData | Nil

    # The token to enable idempotency for VM import requests.
    property client_token : String | Nil

    # A description string for the import image task.
    property description : String | Nil

    # Information about the disk containers.
    property disk_containers : Array(ImageDiskContainer) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Specifies whether the destination AMI of the imported image should be encrypted. The default KMS
    # key for EBS is used unless you specify a non-default KMS key using `KmsKeyId`. For more
    # information, see [Amazon EBS
    # Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html) in the
    # *Amazon Elastic Compute Cloud User Guide*.
    property encrypted : Bool | Nil

    # The target hypervisor platform.
    #
    # Valid values: `xen`
    property hypervisor : String | Nil

    # An identifier for the symmetric KMS key to use when creating the encrypted AMI. This parameter
    # is only required if you want to use a non-default KMS key; if this parameter is not specified,
    # the default KMS key for EBS is used. If a `KmsKeyId` is specified, the `Encrypted` flag must
    # also be set.
    #
    # The KMS key identifier may be provided in any of the following formats:
    #
    # - Key ID
    #
    # - Key alias
    #
    # - ARN using key ID. The ID ARN contains the `arn:aws:kms` namespace, followed by the Region of
    # the key, the Amazon Web Services account ID of the key owner, the `key` namespace, and then the
    # key ID. For example,
    # arn:aws:kms:*us-east-1*:*012345678910*:key/*abcd1234-a123-456a-a12b-a123b4cd56ef*.
    #
    # - ARN using key alias. The alias ARN contains the `arn:aws:kms` namespace, followed by the
    # Region of the key, the Amazon Web Services account ID of the key owner, the `alias` namespace,
    # and then the key alias. For example,
    # arn:aws:kms:*us-east-1*:*012345678910*:alias/*ExampleAlias*.
    #
    # Amazon Web Services parses `KmsKeyId` asynchronously, meaning that the action you call may
    # appear to complete even though you provided an invalid identifier. This action will eventually
    # report failure.
    #
    # The specified KMS key must exist in the Region that the AMI is being copied to.
    #
    # Amazon EBS does not support asymmetric KMS keys.
    property kms_key_id : String | Nil

    # The license type to be used for the Amazon Machine Image (AMI) after importing.
    #
    # Specify `AWS` to replace the source-system license with an Amazon Web Services license or `BYOL`
    # to retain the source-system license. Leaving this parameter undefined is the same as choosing
    # `AWS` when importing a Windows Server operating system, and the same as choosing `BYOL` when
    # importing a Windows client operating system (such as Windows 10) or a Linux operating system.
    #
    # To use `BYOL`, you must have existing licenses with rights to use these licenses in a third
    # party cloud, such as Amazon Web Services. For more information, see
    # [Prerequisites](https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html#prerequisites-image)
    # in the VM Import/Export User Guide.
    property license_type : String | Nil

    # The operating system of the virtual machine. If you import a VM that is compatible with Unified
    # Extensible Firmware Interface (UEFI) using an EBS snapshot, you must specify a value for the
    # platform.
    #
    # Valid values: `Windows` | `Linux`
    property platform : String | Nil

    # The name of the role to use when not using the default role, 'vmimport'.
    property role_name : String | Nil

    # The ARNs of the license configurations.
    property license_specifications : Array(ImportImageLicenseConfigurationRequest) | Nil

    # The tags to apply to the import image task during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # The usage operation value. For more information, see [Licensing
    # options](https://docs.aws.amazon.com/vm-import/latest/userguide/vmie_prereqs.html#prerequisites)
    # in the *VM Import/Export User Guide*.
    property usage_operation : String | Nil

    # The boot mode of the virtual machine.
    #
    # The `uefi-preferred` boot mode isn't supported for importing images. For more information, see
    # [Boot
    # modes](https://docs.aws.amazon.com/vm-import/latest/userguide/prerequisites.html#vmimport-boot-modes)
    # in the *VM Import/Export User Guide*.
    property boot_mode : BootModeValues | Nil

    def initialize(
      @architecture : String | Nil = nil,
      @client_data : ClientData | Nil = nil,
      @client_token : String | Nil = nil,
      @description : String | Nil = nil,
      @disk_containers : Array(ImageDiskContainer) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @hypervisor : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @license_type : String | Nil = nil,
      @platform : String | Nil = nil,
      @role_name : String | Nil = nil,
      @license_specifications : Array(ImportImageLicenseConfigurationRequest) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @usage_operation : String | Nil = nil,
      @boot_mode : BootModeValues | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @architecture
        params << {"#{prefix}Architecture", value}
      end

      if value = @client_data
        params.concat(value.to_query_params("#{prefix}ClientData."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@disk_containers || [] of ImageDiskContainer).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DiskContainer.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @hypervisor
        params << {"#{prefix}Hypervisor", value}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end

      if value = @license_type
        params << {"#{prefix}LicenseType", value}
      end

      if value = @platform
        params << {"#{prefix}Platform", value}
      end

      if value = @role_name
        params << {"#{prefix}RoleName", value}
      end

      (@license_specifications || [] of ImportImageLicenseConfigurationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LicenseSpecifications.#{i}."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @usage_operation
        params << {"#{prefix}UsageOperation", value}
      end

      if value = @boot_mode
        params << {"#{prefix}BootMode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        architecture: Core::XMLValue.string(node.xpath_node("*[local-name()='Architecture']")),
        client_data: node.xpath_node("*[local-name()='ClientData']").try { |n| ClientData.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        disk_containers: node.xpath_nodes("*[local-name()='DiskContainer']/*[local-name()='item']").map { |n| ImageDiskContainer.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='Encrypted']")),
        hypervisor: Core::XMLValue.string(node.xpath_node("*[local-name()='Hypervisor']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyId']")),
        license_type: Core::XMLValue.string(node.xpath_node("*[local-name()='LicenseType']")),
        platform: Core::XMLValue.string(node.xpath_node("*[local-name()='Platform']")),
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")),
        license_specifications: node.xpath_nodes("*[local-name()='LicenseSpecifications']/*[local-name()='item']").map { |n| ImportImageLicenseConfigurationRequest.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        usage_operation: Core::XMLValue.string(node.xpath_node("*[local-name()='UsageOperation']")),
        boot_mode: (n = node.xpath_node("*[local-name()='BootMode']")) ? AEC::BootModeValues.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @client_data
        value.validate!
      end

      if value = @disk_containers
        value.each(&.validate!)
      end

      if value = @license_specifications
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@architecture, @client_data, @client_token, @description, @disk_containers, @dry_run, @encrypted, @hypervisor, @kms_key_id, @license_type, @platform, @role_name, @license_specifications, @tag_specifications, @usage_operation, @boot_mode)
  end
end
