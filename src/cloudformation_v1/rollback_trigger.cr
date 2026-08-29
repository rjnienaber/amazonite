private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RollbackTrigger
    property arn : String

    property type : String

    def initialize(
      @arn : String,
      @type : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}Type", @type}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='Type']")).not_nil!,
      )
    end
  end
end
