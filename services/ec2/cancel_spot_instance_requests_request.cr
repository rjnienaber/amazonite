private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CancelSpotInstanceRequests.
  class CancelSpotInstanceRequestsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the Spot Instance requests.
    property spot_instance_request_ids : Array(String) = [] of String

    def initialize(
      @spot_instance_request_ids : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @spot_instance_request_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}SpotInstanceRequestId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        spot_instance_request_ids: node.xpath_nodes("*[local-name()='SpotInstanceRequestId']/*[local-name()='SpotInstanceRequestId']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @spot_instance_request_ids)
  end
end
