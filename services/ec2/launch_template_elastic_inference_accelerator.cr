private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Inference is no longer available.
  #
  # Describes an elastic inference accelerator.
  class LaunchTemplateElasticInferenceAccelerator
    # The type of elastic inference accelerator. The possible values are eia1.medium, eia1.large, and
    # eia1.xlarge.
    property type : String

    # The number of elastic inference accelerators to attach to the instance.
    property count : Int32 | Nil

    def initialize(
      @type : String,
      @count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Type", @type}

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='Type']")).not_nil!,
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Count']")),
      )
    end

    def validate! : Nil
      if value = @count
        raise Core::ValidationError.new("Count value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@type, @count)
  end
end
