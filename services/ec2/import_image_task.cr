private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an import image task.
  class ImportImageTask
    # The architecture of the virtual machine.
    #
    # Valid values: `i386` | `x86_64` | `arm64`
    property architecture : String | Nil

    # A description of the import task.
    property description : String | Nil

    # Indicates whether the image is encrypted.
    property encrypted : Bool | Nil

    # The target hypervisor for the import task.
    #
    # Valid values: `xen`
    property hypervisor : String | Nil

    # The ID of the Amazon Machine Image (AMI) of the imported virtual machine.
    property image_id : String | Nil

    # The ID of the import image task.
    property import_task_id : String | Nil

    # The identifier for the KMS key that was used to create the encrypted image.
    property kms_key_id : String | Nil

    # The license type of the virtual machine.
    property license_type : String | Nil

    # The description string for the import image task.
    property platform : String | Nil

    # The percentage of progress of the import image task.
    property progress : String | Nil

    # Information about the snapshots.
    property snapshot_details : Array(SnapshotDetail) | Nil

    # A brief status for the import image task.
    property status : String | Nil

    # A descriptive status message for the import image task.
    property status_message : String | Nil

    # The tags for the import image task.
    property tags : Array(Tag) | Nil

    # The ARNs of the license configurations that are associated with the import image task.
    property license_specifications : Array(ImportImageLicenseConfigurationResponse) | Nil

    # The usage operation value.
    property usage_operation : String | Nil

    # The boot mode of the virtual machine.
    property boot_mode : BootModeValues | Nil

    def initialize(
      @architecture : String | Nil = nil,
      @description : String | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @hypervisor : String | Nil = nil,
      @image_id : String | Nil = nil,
      @import_task_id : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @license_type : String | Nil = nil,
      @platform : String | Nil = nil,
      @progress : String | Nil = nil,
      @snapshot_details : Array(SnapshotDetail) | Nil = nil,
      @status : String | Nil = nil,
      @status_message : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @license_specifications : Array(ImportImageLicenseConfigurationResponse) | Nil = nil,
      @usage_operation : String | Nil = nil,
      @boot_mode : BootModeValues | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @architecture
        params << {"#{prefix}Architecture", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @hypervisor
        params << {"#{prefix}Hypervisor", value}
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @import_task_id
        params << {"#{prefix}ImportTaskId", value}
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

      if value = @progress
        params << {"#{prefix}Progress", value}
      end

      (@snapshot_details || [] of SnapshotDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SnapshotDetailSet.#{i}."))
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      (@license_specifications || [] of ImportImageLicenseConfigurationResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LicenseSpecifications.#{i}."))
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
        architecture: Core::XMLValue.string(node.xpath_node("*[local-name()='architecture']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        hypervisor: Core::XMLValue.string(node.xpath_node("*[local-name()='hypervisor']")),
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        import_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='importTaskId']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyId']")),
        license_type: Core::XMLValue.string(node.xpath_node("*[local-name()='licenseType']")),
        platform: Core::XMLValue.string(node.xpath_node("*[local-name()='platform']")),
        progress: Core::XMLValue.string(node.xpath_node("*[local-name()='progress']")),
        snapshot_details: node.xpath_nodes("*[local-name()='snapshotDetailSet']/*[local-name()='item']").map { |n| SnapshotDetail.from_xml(n) },
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        license_specifications: node.xpath_nodes("*[local-name()='licenseSpecifications']/*[local-name()='item']").map { |n| ImportImageLicenseConfigurationResponse.from_xml(n) },
        usage_operation: Core::XMLValue.string(node.xpath_node("*[local-name()='usageOperation']")),
        boot_mode: (n = node.xpath_node("*[local-name()='bootMode']")) ? AEC::BootModeValues.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @snapshot_details
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @license_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@architecture, @description, @encrypted, @hypervisor, @image_id, @import_task_id, @kms_key_id, @license_type, @platform, @progress, @snapshot_details, @status, @status_message, @tags, @license_specifications, @usage_operation, @boot_mode)
  end
end
