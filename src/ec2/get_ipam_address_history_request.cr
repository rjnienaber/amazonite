private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamAddressHistoryRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The CIDR you want the history of. The CIDR can be an IPv4 or IPv6 IP address range. If you enter
    # a /16 IPv4 CIDR, you will get records that match it exactly. You will not get records for any
    # subnets within the /16 CIDR.
    property cidr : String

    # The ID of the IPAM scope that the CIDR is in.
    property ipam_scope_id : String

    # The ID of the VPC you want your history records filtered by.
    property vpc_id : String | Nil

    # The start of the time period for which you are looking for history. If you omit this option, it
    # will default to the value of EndTime.
    property start_time : Time | Nil

    # The end of the time period for which you are looking for history. If you omit this option, it
    # will default to the current time.
    property end_time : Time | Nil

    # The maximum number of historical results you would like returned per page. Defaults to 100.
    property max_results : Int32 | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @cidr : String,
      @ipam_scope_id : String,
      @dry_run : Bool | Nil = nil,
      @vpc_id : String | Nil = nil,
      @start_time : Time | Nil = nil,
      @end_time : Time | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}Cidr", @cidr}

      params << {"#{prefix}IpamScopeId", @ipam_scope_id}

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      if value = @end_time
        params << {"#{prefix}EndTime", Core::QueryValue.time(value)}
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
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamScopeId']")).not_nil!,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='StartTime']")),
        end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTime']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @cidr, @ipam_scope_id, @vpc_id, @start_time, @end_time, @max_results, @next_token)
  end
end
