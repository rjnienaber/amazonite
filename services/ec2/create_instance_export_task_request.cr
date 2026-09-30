private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateInstanceExportTaskRequest
    # The tags to apply to the export instance task during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # A description for the conversion task or the resource being exported. The maximum length is 255
    # characters.
    property description : String | Nil

    # The ID of the instance.
    property instance_id : String

    # The target virtualization environment.
    property target_environment : ExportEnvironment

    # The format and location for an export instance task.
    property export_to_s3_task : ExportToS3TaskSpecification

    def initialize(
      @instance_id : String,
      @target_environment : ExportEnvironment,
      @export_to_s3_task : ExportToS3TaskSpecification,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}TargetEnvironment", @target_environment.to_json_object_key}

      params.concat(@export_to_s3_task.to_query_params("#{prefix}ExportToS3."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")).not_nil!,
        target_environment: ((n = node.xpath_node("*[local-name()='targetEnvironment']")) ? AEC::ExportEnvironment.from_json_object_key?(n.content) : nil).not_nil!,
        export_to_s3_task: node.xpath_node("*[local-name()='exportToS3']").try { |n| ExportToS3TaskSpecification.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @export_to_s3_task
        value.validate!
      end
    end

    def_equals_and_hash(@tag_specifications, @description, @instance_id, @target_environment, @export_to_s3_task)
  end
end
