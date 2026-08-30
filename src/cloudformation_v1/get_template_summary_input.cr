private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The input for the GetTemplateSummary action.
  class GetTemplateSummaryInput
    # Structure that contains the template body with a minimum length of 1 byte and a maximum length
    # of 51,200 bytes.
    #
    # Conditional: You must specify only one of the following parameters: `StackName`, `StackSetName`,
    # `TemplateBody`, or `TemplateURL`.
    property template_body : String | Nil

    # The URL of a file that contains the template body. The URL must point to a template (max size: 1
    # MB) that's located in an Amazon S3 bucket or a Systems Manager document. The location for an
    # Amazon S3 bucket must start with `https://`.
    #
    # Conditional: You must specify only one of the following parameters: `StackName`, `StackSetName`,
    # `TemplateBody`, or `TemplateURL`.
    property template_url : String | Nil

    # The name or the stack ID that's associated with the stack, which aren't always interchangeable.
    # For running stacks, you can specify either the stack's name or its unique stack ID. For deleted
    # stack, you must specify the unique stack ID.
    #
    # Conditional: You must specify only one of the following parameters: `StackName`, `StackSetName`,
    # `TemplateBody`, or `TemplateURL`.
    property stack_name : String | Nil

    # The name or unique ID of the StackSet from which the stack was created.
    #
    # Conditional: You must specify only one of the following parameters: `StackName`, `StackSetName`,
    # `TemplateBody`, or `TemplateURL`.
    property stack_set_name : String | Nil

    # [Service-managed permissions] Specifies whether you are acting as an account administrator in
    # the organization's management account or as a delegated administrator in a member account.
    #
    # By default, `SELF` is specified. Use `SELF` for StackSets with self-managed permissions.
    #
    # - If you are signed in to the management account, specify `SELF`.
    #
    # - If you are signed in to a delegated administrator account, specify `DELEGATED_ADMIN`.
    #
    # Your Amazon Web Services account must be registered as a delegated administrator in the
    # management account. For more information, see [Register a delegated
    # administrator](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-orgs-delegated-admin.html)
    # in the *CloudFormation User Guide*.
    property call_as : CallAs | Nil

    # Specifies options for the `GetTemplateSummary` API action.
    property template_summary_config : TemplateSummaryConfig | Nil

    def initialize(
      @template_body : String | Nil = nil,
      @template_url : String | Nil = nil,
      @stack_name : String | Nil = nil,
      @stack_set_name : String | Nil = nil,
      @call_as : CallAs | Nil = nil,
      @template_summary_config : TemplateSummaryConfig | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @template_body
        params << {"#{prefix}TemplateBody", value}
      end

      if value = @template_url
        params << {"#{prefix}TemplateURL", value}
      end

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @stack_set_name
        params << {"#{prefix}StackSetName", value}
      end

      if value = @call_as
        params << {"#{prefix}CallAs", value.to_json_object_key}
      end

      if value = @template_summary_config
        params.concat(value.to_query_params("#{prefix}TemplateSummaryConfig."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        template_body: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateBody']")),
        template_url: Core::XMLValue.string(node.xpath_node("*[local-name()='TemplateURL']")),
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        stack_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetName']")),
        call_as: (n = node.xpath_node("*[local-name()='CallAs']")) ? ACF::CallAs.from_json_object_key?(n.content) : nil,
        template_summary_config: node.xpath_node("*[local-name()='TemplateSummaryConfig']").try { |n| TemplateSummaryConfig.from_xml(n) },
      )
    end

    def_equals_and_hash(@template_body, @template_url, @stack_name, @stack_set_name, @call_as, @template_summary_config)
  end
end
