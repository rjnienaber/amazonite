private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The summary of a generated template.
  class TemplateSummary
    # The Amazon Resource Name (ARN) of the generated template. The format is
    # `arn:${Partition}:cloudformation:${Region}:${Account}:generatedtemplate/${Id}`. For example,
    # `arn:aws:cloudformation:*us-east-1*:*123456789012*:generatedtemplate/*2e8465c1-9a80-43ea-a3a3-4f2d692fe6dc*
    # `.
    property generated_template_id : String | Nil

    # The name of the generated template.
    property generated_template_name : String | Nil

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

    # The number of resources in the generated template. This is a total of resources in pending,
    # in-progress, completed, and failed states.
    property number_of_resources : Int32 | Nil

    def initialize(
      @generated_template_id : String | Nil = nil,
      @generated_template_name : String | Nil = nil,
      @status : GeneratedTemplateStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_updated_time : Time | Nil = nil,
      @number_of_resources : Int32 | Nil = nil,
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

      if value = @number_of_resources
        params << {"#{prefix}NumberOfResources", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        generated_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateId']")),
        generated_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GeneratedTemplateName']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::GeneratedTemplateStatus.from_json_object_key?(n.content) : nil,
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTime']")),
        last_updated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastUpdatedTime']")),
        number_of_resources: Core::XMLValue.i32(node.xpath_node("*[local-name()='NumberOfResources']")),
      )
    end
  end
end
