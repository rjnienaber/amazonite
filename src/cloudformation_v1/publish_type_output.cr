private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class PublishTypeOutput
    property public_type_arn : String | Nil

    def initialize(
      @public_type_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @public_type_arn
        params << {"#{prefix}PublicTypeArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicTypeArn']")),
      )
    end
  end
end
