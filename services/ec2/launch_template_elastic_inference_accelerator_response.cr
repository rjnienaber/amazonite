private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Inference is no longer available.
  #
  # Describes an elastic inference accelerator.
  class LaunchTemplateElasticInferenceAcceleratorResponse
    # The type of elastic inference accelerator. The possible values are eia1.medium, eia1.large, and
    # eia1.xlarge.
    property type : String | Nil

    # The number of elastic inference accelerators to attach to the instance.
    property count : Int32 | Nil

    def initialize(
      @type : String | Nil = nil,
      @count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value}
      end

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='type']")),
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='count']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type, @count)
  end
end
