private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkInsightsAccessScopeRequest
    # The paths to match.
    property match_paths : Array(AccessScopePathRequest) | Nil

    # The paths to exclude.
    property exclude_paths : Array(AccessScopePathRequest) | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String

    # The tags to apply.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @client_token : String,
      @match_paths : Array(AccessScopePathRequest) | Nil = nil,
      @exclude_paths : Array(AccessScopePathRequest) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@match_paths || [] of AccessScopePathRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MatchPath.#{i}."))
      end

      (@exclude_paths || [] of AccessScopePathRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ExcludePath.#{i}."))
      end

      params << {"#{prefix}ClientToken", @client_token}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        match_paths: node.xpath_nodes("*[local-name()='MatchPath']/*[local-name()='item']").map { |n| AccessScopePathRequest.from_xml(n) },
        exclude_paths: node.xpath_nodes("*[local-name()='ExcludePath']/*[local-name()='item']").map { |n| AccessScopePathRequest.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @match_paths
        value.each(&.validate!)
      end

      if value = @exclude_paths
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@match_paths, @exclude_paths, @client_token, @tag_specifications, @dry_run)
  end
end
