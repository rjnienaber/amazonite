private alias Core = Amazonite::Core

module Amazonite::StsV1
  class FederatedUser
    property federated_user_id : String

    property arn : String

    def initialize(
      @federated_user_id : String,
      @arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}FederatedUserId", @federated_user_id}

      params << {"#{prefix}Arn", @arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        federated_user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FederatedUserId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
      )
    end
  end
end
