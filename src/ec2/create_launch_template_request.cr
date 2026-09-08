private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateLaunchTemplateRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If a
    # client token isn't specified, a randomly generated token is used in the request to ensure
    # idempotency.
    #
    # For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    #
    # Constraint: Maximum 128 ASCII characters.
    property client_token : String | Nil

    # A name for the launch template.
    property launch_template_name : String

    # A description for the first version of the launch template.
    property version_description : String | Nil

    # The information for the launch template.
    property launch_template_data : RequestLaunchTemplateData

    # Reserved for internal use.
    property operator : OperatorRequest | Nil

    # The tags to apply to the launch template on creation. To tag the launch template, the resource
    # type must be `launch-template`.
    #
    # To specify the tags for the resources that are created when an instance is launched, you must
    # use the `TagSpecifications` parameter in the [launch template
    # data](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RequestLaunchTemplateData.html)
    # structure.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @launch_template_name : String,
      @launch_template_data : RequestLaunchTemplateData,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @version_description : String | Nil = nil,
      @operator : OperatorRequest | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      params << {"#{prefix}LaunchTemplateName", @launch_template_name}

      if value = @version_description
        params << {"#{prefix}VersionDescription", value}
      end

      params.concat(@launch_template_data.to_query_params("#{prefix}LaunchTemplateData."))

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LaunchTemplateName']")).not_nil!,
        version_description: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionDescription']")),
        launch_template_data: node.xpath_node("*[local-name()='LaunchTemplateData']").try { |n| RequestLaunchTemplateData.from_xml(n) }.not_nil!,
        operator: node.xpath_node("*[local-name()='Operator']").try { |n| OperatorRequest.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @version_description
        raise Core::ValidationError.new("VersionDescription length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("VersionDescription length must be <= 255") if value.size > 255
      end

      if value = @launch_template_data
        value.validate!
      end

      if value = @operator
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @client_token, @launch_template_name, @version_description, @launch_template_data, @operator, @tag_specifications)
  end
end
