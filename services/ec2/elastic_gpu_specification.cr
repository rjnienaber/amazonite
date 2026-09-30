private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Graphics reached end of life on January 8, 2024.
  #
  # A specification for an Elastic Graphics accelerator.
  class ElasticGpuSpecification
    # The type of Elastic Graphics accelerator.
    property type : String

    def initialize(
      @type : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Type", @type}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='Type']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type)
  end
end
