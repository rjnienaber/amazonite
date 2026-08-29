private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class EstimateTemplateCostOutput
    property url : String | Nil

    def initialize(
      @url : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @url
        params << {"#{prefix}Url", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        url: Core::XMLValue.string(node.xpath_node("*[local-name()='Url']")),
      )
    end
  end
end
