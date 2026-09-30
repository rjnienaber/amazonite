private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for PurchaseScheduledInstances.
  class PurchaseScheduledInstancesRequest
    # Unique, case-sensitive identifier that ensures the idempotency of the request. For more
    # information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The purchase requests.
    property purchase_requests : Array(PurchaseRequest) = [] of PurchaseRequest

    def initialize(
      @purchase_requests : Array(PurchaseRequest),
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

      @purchase_requests.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PurchaseRequest.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        purchase_requests: node.xpath_nodes("*[local-name()='PurchaseRequest']/*[local-name()='PurchaseRequest']").map { |n| PurchaseRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @purchase_requests
        raise Core::ValidationError.new("PurchaseRequests must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @dry_run, @purchase_requests)
  end
end
