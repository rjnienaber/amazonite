private alias Core = Amazonite::Core

module Amazonite::EC2
  class StartNetworkInsightsAnalysisRequest
    # The ID of the path.
    property network_insights_path_id : String

    # The member accounts that contain resources that the path can traverse.
    property additional_accounts : Array(String) | Nil

    # The Amazon Resource Names (ARN) of the resources that the path must traverse.
    property filter_in_arns : Array(String) | Nil

    # The Amazon Resource Names (ARN) of the resources that the path will ignore.
    property filter_out_arns : Array(String) | Nil

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
      @network_insights_path_id : String,
      @client_token : String,
      @additional_accounts : Array(String) | Nil = nil,
      @filter_in_arns : Array(String) | Nil = nil,
      @filter_out_arns : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NetworkInsightsPathId", @network_insights_path_id}

      (@additional_accounts || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AdditionalAccount.#{i}", item}
      end

      (@filter_in_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FilterInArn.#{i}", item}
      end

      (@filter_out_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}FilterOutArn.#{i}", item}
      end

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
        network_insights_path_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInsightsPathId']")).not_nil!,
        additional_accounts: node.xpath_nodes("*[local-name()='AdditionalAccount']/*[local-name()='item']").map { |n| n.content },
        filter_in_arns: node.xpath_nodes("*[local-name()='FilterInArn']/*[local-name()='item']").map { |n| n.content },
        filter_out_arns: node.xpath_nodes("*[local-name()='FilterOutArn']/*[local-name()='item']").map { |n| n.content },
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

    def_equals_and_hash(@network_insights_path_id, @additional_accounts, @filter_in_arns, @filter_out_arns, @dry_run, @tag_specifications, @client_token)
  end
end
