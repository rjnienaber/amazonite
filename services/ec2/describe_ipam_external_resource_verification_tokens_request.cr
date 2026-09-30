private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamExternalResourceVerificationTokensRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more filters for the request. For more information about filtering, see [Filtering CLI
    # output](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html).
    #
    # Available filters:
    #
    # - `ipam-arn`
    #
    # - `ipam-external-resource-verification-token-arn`
    #
    # - `ipam-external-resource-verification-token-id`
    #
    # - `ipam-id`
    #
    # - `ipam-region`
    #
    # - `state`
    #
    # - `status`
    #
    # - `token-name`
    #
    # - `token-value`
    property filters : Array(Filter) | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # The maximum number of tokens to return in one page of results.
    property max_results : Int32 | Nil

    # Verification token IDs.
    property ipam_external_resource_verification_token_ids : Array(String) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @ipam_external_resource_verification_token_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      (@ipam_external_resource_verification_token_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}IpamExternalResourceVerificationTokenId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        ipam_external_resource_verification_token_ids: node.xpath_nodes("*[local-name()='IpamExternalResourceVerificationTokenId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@dry_run, @filters, @next_token, @max_results, @ipam_external_resource_verification_token_ids)
  end
end
