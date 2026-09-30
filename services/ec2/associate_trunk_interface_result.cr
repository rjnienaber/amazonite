private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateTrunkInterfaceResult
    # Information about the association between the trunk network interface and branch network
    # interface.
    property interface_association : TrunkInterfaceAssociation | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @interface_association : TrunkInterfaceAssociation | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @interface_association
        params.concat(value.to_query_params("#{prefix}InterfaceAssociation."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        interface_association: node.xpath_node("*[local-name()='interfaceAssociation']").try { |n| TrunkInterfaceAssociation.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @interface_association
        value.validate!
      end
    end

    def_equals_and_hash(@interface_association, @client_token)
  end
end
