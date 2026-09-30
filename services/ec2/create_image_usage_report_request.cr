private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateImageUsageReportRequest
    # The ID of the image to report on.
    property image_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The resource types to include in the report.
    property resource_types : Array(ImageUsageResourceTypeRequest) = [] of ImageUsageResourceTypeRequest

    # The Amazon Web Services account IDs to include in the report. To include all accounts, omit this
    # parameter.
    property account_ids : Array(String) | Nil

    # A unique, case-sensitive identifier that you provide to ensure idempotency of the request.
    property client_token : String | Nil

    # The tags to apply to the report on creation. The `ResourceType` must be set to
    # `image-usage-report`; any other value will cause the report creation to fail.
    #
    # To tag a report after it has been created, see
    # [CreateTags](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTags.html).
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @image_id : String,
      @resource_types : Array(ImageUsageResourceTypeRequest),
      @dry_run : Bool | Nil = nil,
      @account_ids : Array(String) | Nil = nil,
      @client_token : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @resource_types.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceType.#{i}."))
      end

      (@account_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AccountId.#{i}", item}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        resource_types: node.xpath_nodes("*[local-name()='ResourceType']/*[local-name()='item']").map { |n| ImageUsageResourceTypeRequest.from_xml(n) },
        account_ids: node.xpath_nodes("*[local-name()='AccountId']/*[local-name()='UserId']").map { |n| n.content },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @resource_types
        value.each(&.validate!)
      end

      if value = @account_ids
        raise Core::ValidationError.new("AccountIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AccountIds must have at most 200 item(s)") if value.size > 200
      end

      if value = @client_token
        raise Core::ValidationError.new("ClientToken length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ClientToken length must be <= 128") if value.size > 128
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_id, @dry_run, @resource_types, @account_ids, @client_token, @tag_specifications)
  end
end
