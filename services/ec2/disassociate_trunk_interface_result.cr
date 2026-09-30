private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateTrunkInterfaceResult
    # Is `true` if the request succeeds and an error otherwise.
    property return : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @return : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@return, @client_token)
  end
end
