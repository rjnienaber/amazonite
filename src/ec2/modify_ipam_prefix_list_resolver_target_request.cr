private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamPrefixListResolverTargetRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM prefix list resolver target to modify.
    property ipam_prefix_list_resolver_target_id : String

    # The desired version of the prefix list to target. This allows you to pin the target to a
    # specific version.
    property desired_version : Int64 | Nil

    # Indicates whether the resolver target should automatically track the latest version of the
    # prefix list. When enabled, the target will always synchronize with the most current version.
    #
    # Choose this for automatic updates when you want your prefix lists to stay current with
    # infrastructure changes without manual intervention.
    property track_latest_version : Bool | Nil

    # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @ipam_prefix_list_resolver_target_id : String,
      @dry_run : Bool | Nil = nil,
      @desired_version : Int64 | Nil = nil,
      @track_latest_version : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPrefixListResolverTargetId", @ipam_prefix_list_resolver_target_id}

      if value = @desired_version
        params << {"#{prefix}DesiredVersion", value.to_s}
      end

      if value = @track_latest_version
        params << {"#{prefix}TrackLatestVersion", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_prefix_list_resolver_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPrefixListResolverTargetId']")).not_nil!,
        desired_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='DesiredVersion']")),
        track_latest_version: Core::XMLValue.bool(node.xpath_node("*[local-name()='TrackLatestVersion']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_prefix_list_resolver_target_id, @desired_version, @track_latest_version, @client_token)
  end
end
