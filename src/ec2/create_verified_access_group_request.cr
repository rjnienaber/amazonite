private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVerifiedAccessGroupRequest
    # The ID of the Verified Access instance.
    property verified_access_instance_id : String

    # A description for the Verified Access group.
    property description : String | Nil

    # The Verified Access policy document.
    property policy_document : String | Nil

    # The tags to assign to the Verified Access group.
    property tag_specifications : Array(TagSpecification) | Nil

    # A unique, case-sensitive token that you provide to ensure idempotency of your modification
    # request. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The options for server side encryption.
    property sse_specification : VerifiedAccessSseSpecificationRequest | Nil

    def initialize(
      @verified_access_instance_id : String,
      @description : String | Nil = nil,
      @policy_document : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @sse_specification : VerifiedAccessSseSpecificationRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}VerifiedAccessInstanceId", @verified_access_instance_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @sse_specification
        params.concat(value.to_query_params("#{prefix}SseSpecification."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VerifiedAccessInstanceId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        sse_specification: node.xpath_node("*[local-name()='SseSpecification']").try { |n| VerifiedAccessSseSpecificationRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @sse_specification
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_instance_id, @description, @policy_document, @tag_specifications, @client_token, @dry_run, @sse_specification)
  end
end
