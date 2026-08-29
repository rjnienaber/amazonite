private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RegisterPublisherInput
    property accept_terms_and_conditions : Bool | Nil

    property connection_arn : String | Nil

    def initialize(
      @accept_terms_and_conditions : Bool | Nil = nil,
      @connection_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @accept_terms_and_conditions
        params << {"#{prefix}AcceptTermsAndConditions", Core::QueryValue.bool(value)}
      end

      if value = @connection_arn
        params << {"#{prefix}ConnectionArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accept_terms_and_conditions: Core::XMLValue.bool(node.xpath_node("*[local-name()='AcceptTermsAndConditions']")),
        connection_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ConnectionArn']")),
      )
    end
  end
end
