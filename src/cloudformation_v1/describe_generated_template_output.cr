private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeGeneratedTemplateOutput
    # The Amazon Resource Name (ARN) of the generated template. The format is
    # `arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}`. For example,
    # `arn:aws:cloudformation:*us-east-1*:*123456789012*:generatedtemplate/*2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc*
    # `.
    property generated_template_id : String | Nil

    # The name of the generated template.
    property generated_template_name : String | Nil

    # A list of objects describing the details of the resources in the template generation.
    property resources : Array(ResourceDetail) | Nil

    # The status of the template generation. Supported values are:
    #
    # - `CreatePending` - the creation of the template is pending.
    #
    # - `CreateInProgress` - the creation of the template is in progress.
    #
    # - `DeletePending` - the deletion of the template is pending.
    #
    # - `DeleteInProgress` - the deletion of the template is in progress.
    #
    # - `UpdatePending` - the update of the template is pending.
    #
    # - `UpdateInProgress` - the update of the template is in progress.
    #
    # - `Failed` - the template operation failed.
    #
    # - `Complete` - the template operation is complete.
    property status : GeneratedTemplateStatus | Nil

    # The reason for the current template generation status. This will provide more details if a
    # failure happened.
    property status_reason : String | Nil

    # The time the generated template was created.
    property creation_time : Time | Nil

    # The time the generated template was last updated.
    property last_updated_time : Time | Nil

    # An object describing the progress of the template generation.
    property progress : TemplateProgress | Nil

    # The stack ARN of the base stack if a base stack was provided when generating the template.
    property stack_id : String | Nil

    # The configuration details of the generated template, including the `DeletionPolicy` and
    # `UpdateReplacePolicy`.
    property template_configuration : TemplateConfiguration | Nil

    # The number of warnings generated for this template. The warnings are found in the details of
    # each of the resources in the template.
    property total_warnings : Int32 | Nil

    def initialize(
      @generated_template_id : String | Nil = nil,
      @generated_template_name : String | Nil = nil,
      @resources : Array(ResourceDetail) | Nil = nil,
      @status : GeneratedTemplateStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_updated_time : Time | Nil = nil,
      @progress : TemplateProgress | Nil = nil,
      @stack_id : String | Nil = nil,
      @template_configuration : TemplateConfiguration | Nil = nil,
      @total_warnings : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @generated_template_id
        params << {"#{prefix}GeneratedTemplateId", value}
      end

      if value = @generated_template_name
        params << {"#{prefix}GeneratedTemplateName", value}
      end

      (@resources || [] of ResourceDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Resources.member.#{i}."))
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      if value = @last_updated_time
        params << {"#{prefix}LastUpdatedTime", Core::QueryValue.time(value)}
      end

      if value = @progress
        params.concat(value.to_query_params("#{prefix}Progress."))
      end

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      if value = @template_configuration
        params.concat(value.to_query_params("#{prefix}TemplateConfiguration."))
      end

      if value = @total_warnings
        params << {"#{prefix}TotalWarnings", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        generated_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateId']")),
        generated_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateName']")),
        resources: node.xpath_nodes("*[local-name()='Resources']/*[local-name()='member']").map { |n| ResourceDetail.from_xml(n) },
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::GeneratedTemplateStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTime']")),
        last_updated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUpdatedTime']")),
        progress: node.xpath_node("*[local-name()='Progress']").try { |n| TemplateProgress.from_xml(n) },
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        template_configuration: node.xpath_node("*[local-name()='TemplateConfiguration']").try { |n| TemplateConfiguration.from_xml(n) },
        total_warnings: Core::XMLValue.i32(node.xpath_node("*[local-name()='TotalWarnings']")),
      )
    end
  end
end
