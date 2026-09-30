private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetConsoleScreenshotResult
    # The data that comprises the image.
    property image_data : String | Nil

    # The ID of the instance.
    property instance_id : String | Nil

    def initialize(
      @image_data : String | Nil = nil,
      @instance_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @image_data
        params << {"#{prefix}ImageData", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_data: Core::XMLValue.string(node.xpath_node("*[local-name()='imageData']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_data, @instance_id)
  end
end
