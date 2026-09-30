private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a path component.
  class AnalysisComponent
    # The ID of the component.
    property id : String | Nil

    # The Amazon Resource Name (ARN) of the component.
    property arn : String | Nil

    # The name of the analysis component.
    property name : String | Nil

    def initialize(
      @id : String | Nil = nil,
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @id
        params << {"#{prefix}Id", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='id']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='arn']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @arn, @name)
  end
end
