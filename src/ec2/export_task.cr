private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an export instance task.
  class ExportTask
    # A description of the resource being exported.
    property description : String | Nil

    # The ID of the export task.
    property export_task_id : String | Nil

    # Information about the export task.
    property export_to_s3_task : ExportToS3Task | Nil

    # Information about the instance to export.
    property instance_export_details : InstanceExportDetails | Nil

    # The state of the export task.
    property state : ExportTaskState | Nil

    # The status message related to the export task.
    property status_message : String | Nil

    # The tags for the export task.
    property tags : Array(Tag) | Nil

    def initialize(
      @description : String | Nil = nil,
      @export_task_id : String | Nil = nil,
      @export_to_s3_task : ExportToS3Task | Nil = nil,
      @instance_export_details : InstanceExportDetails | Nil = nil,
      @state : ExportTaskState | Nil = nil,
      @status_message : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @export_task_id
        params << {"#{prefix}ExportTaskId", value}
      end

      if value = @export_to_s3_task
        params.concat(value.to_query_params("#{prefix}ExportToS3."))
      end

      if value = @instance_export_details
        params.concat(value.to_query_params("#{prefix}InstanceExport."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        export_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='exportTaskId']")),
        export_to_s3_task: node.xpath_node("*[local-name()='exportToS3']").try { |n| ExportToS3Task.from_xml(n) },
        instance_export_details: node.xpath_node("*[local-name()='instanceExport']").try { |n| InstanceExportDetails.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::ExportTaskState.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @export_to_s3_task
        value.validate!
      end

      if value = @instance_export_details
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @export_task_id, @export_to_s3_task, @instance_export_details, @state, @status_message, @tags)
  end
end
