private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an AMI that is currently in the Recycle Bin.
  class ImageRecycleBinInfo
    # The ID of the AMI.
    property image_id : String | Nil

    # The name of the AMI.
    property name : String | Nil

    # The description of the AMI.
    property description : String | Nil

    # The date and time when the AMI entered the Recycle Bin.
    property recycle_bin_enter_time : Time | Nil

    # The date and time when the AMI is to be permanently deleted from the Recycle Bin.
    property recycle_bin_exit_time : Time | Nil

    def initialize(
      @image_id : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @recycle_bin_enter_time : Time | Nil = nil,
      @recycle_bin_exit_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @recycle_bin_enter_time
        params << {"#{prefix}RecycleBinEnterTime", Core::QueryValue.time(value)}
      end

      if value = @recycle_bin_exit_time
        params << {"#{prefix}RecycleBinExitTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        recycle_bin_enter_time: Core::XMLValue.time(node.xpath_node("*[local-name()='recycleBinEnterTime']")),
        recycle_bin_exit_time: Core::XMLValue.time(node.xpath_node("*[local-name()='recycleBinExitTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_id, @name, @description, @recycle_bin_enter_time, @recycle_bin_exit_time)
  end
end
