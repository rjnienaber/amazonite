private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the media accelerators for the instance type.
  class MediaAcceleratorInfo
    # Describes the media accelerators for the instance type.
    property accelerators : Array(MediaDeviceInfo) | Nil

    # The total size of the memory for the media accelerators for the instance type, in MiB.
    property total_media_memory_in_mi_b : Int32 | Nil

    def initialize(
      @accelerators : Array(MediaDeviceInfo) | Nil = nil,
      @total_media_memory_in_mi_b : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@accelerators || [] of MediaDeviceInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Accelerators.#{i}."))
      end

      if value = @total_media_memory_in_mi_b
        params << {"#{prefix}TotalMediaMemoryInMiB", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accelerators: node.xpath_nodes("*[local-name()='accelerators']/*[local-name()='item']").map { |n| MediaDeviceInfo.from_xml(n) },
        total_media_memory_in_mi_b: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalMediaMemoryInMiB']")),
      )
    end

    def validate! : Nil
      if value = @accelerators
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@accelerators, @total_media_memory_in_mi_b)
  end
end
