private alias Core = Amazonite::Core

module Amazonite::StsV1
  class PolicyDescriptorType
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}arn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='arn']")),
      )
    end
  end
end
