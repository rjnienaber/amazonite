private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an export image task.
  class ExportImageTask
    # A description of the image being exported.
    property description : String | Nil

    # The ID of the export image task.
    property export_image_task_id : String | Nil

    # The ID of the image.
    property image_id : String | Nil

    # The percent complete of the export image task.
    property progress : String | Nil

    # Information about the destination Amazon S3 bucket.
    property s3_export_location : ExportTaskS3Location | Nil

    # The status of the export image task. The possible values are `active`, `completed`, `deleting`,
    # and `deleted`.
    property status : String | Nil

    # The status message for the export image task.
    property status_message : String | Nil

    # Any tags assigned to the export image task.
    property tags : Array(Tag) | Nil

    def initialize(
      @description : String | Nil = nil,
      @export_image_task_id : String | Nil = nil,
      @image_id : String | Nil = nil,
      @progress : String | Nil = nil,
      @s3_export_location : ExportTaskS3Location | Nil = nil,
      @status : String | Nil = nil,
      @status_message : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @export_image_task_id
        params << {"#{prefix}ExportImageTaskId", value}
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @progress
        params << {"#{prefix}Progress", value}
      end

      if value = @s3_export_location
        params.concat(value.to_query_params("#{prefix}S3ExportLocation."))
      end

      if value = @status
        params << {"#{prefix}Status", value}
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
        export_image_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='exportImageTaskId']")),
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='imageId']")),
        progress: Core::XMLValue.string(node.xpath_node("*[local-name()='progress']")),
        s3_export_location: node.xpath_node("*[local-name()='s3ExportLocation']").try { |n| ExportTaskS3Location.from_xml(n) },
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @s3_export_location
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @export_image_task_id, @image_id, @progress, @s3_export_location, @status, @status_message, @tags)
  end
end
