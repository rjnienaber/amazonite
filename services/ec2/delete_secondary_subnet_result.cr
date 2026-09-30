private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteSecondarySubnetResult
    # Information about the secondary subnet being deleted.
    property secondary_subnet : SecondarySubnet | Nil

    # Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a
    # client token was provided in the request.
    property client_token : String | Nil

    def initialize(
      @secondary_subnet : SecondarySubnet | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @secondary_subnet
        params.concat(value.to_query_params("#{prefix}SecondarySubnet."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        secondary_subnet: node.xpath_node("*[local-name()='secondarySubnet']").try { |n| SecondarySubnet.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @secondary_subnet
        value.validate!
      end
    end

    def_equals_and_hash(@secondary_subnet, @client_token)
  end
end
