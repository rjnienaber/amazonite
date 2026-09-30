private alias Core = Amazonite::Core

module Amazonite::EC2
  # Deprecated.
  #
  # Amazon Elastic Graphics reached end of life on January 8, 2024.
  class ElasticGpuSpecificationResponse
    # Deprecated.
    #
    # Amazon Elastic Graphics reached end of life on January 8, 2024.
    property type : String | Nil

    def initialize(
      @type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='type']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type)
  end
end
