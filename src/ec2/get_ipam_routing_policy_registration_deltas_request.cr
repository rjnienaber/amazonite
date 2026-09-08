private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamRoutingPolicyRegistrationDeltasRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM internet registry association.
    property ipam_internet_registry_association_id : String

    # Filter results to a specific delta ID.
    property delta_id : String | Nil

    # The start of the time range to filter deltas by.
    property start_time : Time | Nil

    # The end of the time range to filter deltas by.
    property end_time : Time | Nil

    # The chronological order to return results in. Valid values: `forward` | `reverse`.
    property chronological_order : ChronologicalOrder | Nil

    # The maximum number of results to return in a single call. If not specified, all available
    # results are returned. To retrieve the remaining results, make another call with the returned
    # `nextToken` value.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @ipam_internet_registry_association_id : String,
      @dry_run : Bool | Nil = nil,
      @delta_id : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @chronological_order : ChronologicalOrder | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamInternetRegistryAssociationId", @ipam_internet_registry_association_id}

      if value = @delta_id
        params << {"#{prefix}DeltaId", value}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
      end

      if value = @chronological_order
        params << {"#{prefix}ChronologicalOrder", value.to_json_object_key}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_internet_registry_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamInternetRegistryAssociationId']")).not_nil!,
        delta_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DeltaId']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='StartTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTime']")),
        chronological_order: (n = node.xpath_node("*[local-name()='ChronologicalOrder']")) ? AEC::ChronologicalOrder.from_json_object_key?(n.content) : nil,
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @ipam_internet_registry_association_id, @delta_id, @start_time, @end_time, @chronological_order, @max_results, @next_token)
  end
end
