private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an potential intermediate component of a feasible path.
  class AlternatePathHint
    # The ID of the component.
    property component_id : String | Nil

    # The Amazon Resource Name (ARN) of the component.
    property component_arn : String | Nil

    def initialize(
      @component_id : String | Nil = nil,
      @component_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @component_id
        params << {"#{prefix}ComponentId", value}
      end

      if value = @component_arn
        params << {"#{prefix}ComponentArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        component_id: Core::XMLValue.string(node.xpath_node("*[local-name()='componentId']")),
        component_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='componentArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@component_id, @component_arn)
  end
end
