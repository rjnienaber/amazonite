private alias Core = Amazonite::Core

module Amazonite::EC2
  class StartNetworkInsightsAccessScopeAnalysisRequest
    # The ID of the Network Access Scope.
    property network_insights_access_scope_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to apply.
    property tag_specifications : Array(TagSpecification) | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String

    def initialize(
      @network_insights_access_scope_id : String,
      @client_token : String,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NetworkInsightsAccessScopeId", @network_insights_access_scope_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      params << {"#{prefix}ClientToken", @client_token}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_insights_access_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInsightsAccessScopeId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_insights_access_scope_id, @dry_run, @tag_specifications, @client_token)
  end
end
