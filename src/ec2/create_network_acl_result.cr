private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkAclResult
    # Information about the network ACL.
    property network_acl : NetworkAcl | Nil

    # Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a
    # client token was provided in the request.
    property client_token : String | Nil

    def initialize(
      @network_acl : NetworkAcl | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_acl
        params.concat(value.to_query_params("#{prefix}NetworkAcl."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_acl: node.xpath_node("*[local-name()='networkAcl']").try { |n| NetworkAcl.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @network_acl
        value.validate!
      end
    end

    def_equals_and_hash(@network_acl, @client_token)
  end
end
