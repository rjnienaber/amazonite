private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeGeneratedTemplateOutput
    property generated_template_id : String | Nil

    property generated_template_name : String | Nil

    property resources : Array(ResourceDetail) | Nil

    property status : GeneratedTemplateStatus | Nil

    property status_reason : String | Nil

    property creation_time : Time | Nil

    property last_updated_time : Time | Nil

    property progress : TemplateProgress | Nil

    property stack_id : String | Nil

    property template_configuration : TemplateConfiguration | Nil

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
