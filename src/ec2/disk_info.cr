private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a disk.
  class DiskInfo
    # The size of the disk in GB.
    property size_in_gb : Int64 | Nil

    # The number of disks with this configuration.
    property count : Int32 | Nil

    # The type of disk.
    property type : DiskType | Nil

    def initialize(
      @size_in_gb : Int64 | Nil = nil,
      @count : Int32 | Nil = nil,
      @type : DiskType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @size_in_gb
        params << {"#{prefix}SizeInGB", value.to_s}
      end

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        size_in_gb: Core::XMLValue.i64(node.xpath_node("*[local-name()='sizeInGB']")),
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='count']")),
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::DiskType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@size_in_gb, @count, @type)
  end
end
