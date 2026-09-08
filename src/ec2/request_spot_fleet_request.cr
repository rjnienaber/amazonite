private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for RequestSpotFleet.
  class RequestSpotFleetRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The configuration for the Spot Fleet request.
    property spot_fleet_request_config : SpotFleetRequestConfigData

    def initialize(
      @spot_fleet_request_config : SpotFleetRequestConfigData,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params.concat(@spot_fleet_request_config.to_query_params("#{prefix}SpotFleetRequestConfig."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        spot_fleet_request_config: node.xpath_node("*[local-name()='spotFleetRequestConfig']").try { |n| SpotFleetRequestConfigData.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @spot_fleet_request_config
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @spot_fleet_request_config)
  end
end
