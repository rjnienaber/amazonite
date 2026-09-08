private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the instance store features that are supported by the instance type.
  class InstanceStorageInfo
    # The total size of the disks, in GB.
    property total_size_in_gb : Int64 | Nil

    # Describes the disks that are available for the instance type.
    property disks : Array(DiskInfo) | Nil

    # Indicates whether non-volatile memory express (NVMe) is supported.
    property nvme_support : EphemeralNvmeSupport | Nil

    # Indicates whether data is encrypted at rest.
    property encryption_support : InstanceStorageEncryptionSupport | Nil

    def initialize(
      @total_size_in_gb : Int64 | Nil = nil,
      @disks : Array(DiskInfo) | Nil = nil,
      @nvme_support : EphemeralNvmeSupport | Nil = nil,
      @encryption_support : InstanceStorageEncryptionSupport | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @total_size_in_gb
        params << {"#{prefix}TotalSizeInGB", value.to_s}
      end

      (@disks || [] of DiskInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Disks.#{i}."))
      end

      if value = @nvme_support
        params << {"#{prefix}NvmeSupport", value.to_json_object_key}
      end

      if value = @encryption_support
        params << {"#{prefix}EncryptionSupport", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        total_size_in_gb: Core::XMLValue.i64(node.xpath_node("*[local-name()='totalSizeInGB']")),
        disks: node.xpath_nodes("*[local-name()='disks']/*[local-name()='item']").map { |n| DiskInfo.from_xml(n) },
        nvme_support: (n = node.xpath_node("*[local-name()='nvmeSupport']")) ? AEC::EphemeralNvmeSupport.from_json_object_key?(n.content) : nil,
        encryption_support: (n = node.xpath_node("*[local-name()='encryptionSupport']")) ? AEC::InstanceStorageEncryptionSupport.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @disks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@total_size_in_gb, @disks, @nvme_support, @encryption_support)
  end
end
