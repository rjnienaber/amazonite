private alias Core = Amazonite::Core

module Amazonite::StsV1
  class ProvidedContext
    property provider_arn : String | Nil

    property context_assertion : String | Nil

    def initialize(
      @provider_arn : String | Nil = nil,
      @context_assertion : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @provider_arn
        params << {"#{prefix}ProviderArn", value}
      end

      if value = @context_assertion
        params << {"#{prefix}ContextAssertion", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ProviderArn']")),
        context_assertion: Core::XMLValue.string(node.xpath_node("*[local-name()='ContextAssertion']")),
      )
    end
  end
end
