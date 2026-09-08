private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CancelSpotFleetRequests.
  class CancelSpotFleetRequestsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The IDs of the Spot Fleet requests.
    #
    # Constraint: You can specify up to 100 IDs in a single request.
    property spot_fleet_request_ids : Array(String) = [] of String

    # Indicates whether to terminate the associated instances when the Spot Fleet request is canceled.
    # The default is to terminate the instances.
    #
    # To let the instances continue to run after the Spot Fleet request is canceled, specify
    # `no-terminate-instances`.
    property terminate_instances : Bool

    def initialize(
      @spot_fleet_request_ids : Array(String),
      @terminate_instances : Bool,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @spot_fleet_request_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}SpotFleetRequestId.#{i}", item}
      end

      params << {"#{prefix}TerminateInstances", Core::QueryValue.bool(@terminate_instances)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        spot_fleet_request_ids: node.xpath_nodes("*[local-name()='spotFleetRequestId']/*[local-name()='item']").map { |n| n.content },
        terminate_instances: Core::XMLValue.bool(node.xpath_node("*[local-name()='terminateInstances']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @spot_fleet_request_ids, @terminate_instances)
  end
end
