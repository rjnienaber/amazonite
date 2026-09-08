private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteSecondaryNetworkRequest
    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensure
    # Idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the secondary network.
    property secondary_network_id : String

    def initialize(
      @secondary_network_id : String,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}SecondaryNetworkId", @secondary_network_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        secondary_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SecondaryNetworkId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_token, @dry_run, @secondary_network_id)
  end
end
