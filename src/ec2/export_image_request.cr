private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ExportImageRequest
    # Token to enable idempotency for export image requests.
    property client_token : String | Nil

    # A description of the image being exported. The maximum length is 255 characters.
    property description : String | Nil

    # The disk image format.
    property disk_image_format : DiskImageFormat

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the image.
    property image_id : String

    # The Amazon S3 bucket for the destination image. The destination bucket must exist.
    property s3_export_location : ExportTaskS3LocationRequest

    # The name of the role that grants VM Import/Export permission to export images to your Amazon S3
    # bucket. If this parameter is not specified, the default role is named 'vmimport'.
    property role_name : String | Nil

    # The tags to apply to the export image task during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @disk_image_format : DiskImageFormat,
      @image_id : String,
      @s3_export_location : ExportTaskS3LocationRequest,
      @client_token : String | Nil = nil,
      @description : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @role_name : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      params << {"#{prefix}DiskImageFormat", @disk_image_format.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ImageId", @image_id}

      params.concat(@s3_export_location.to_query_params("#{prefix}S3ExportLocation."))

      if value = @role_name
        params << {"#{prefix}RoleName", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        disk_image_format: ((n = node.xpath_node("*[local-name()='DiskImageFormat']")) ? AEC::DiskImageFormat.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        s3_export_location: node.xpath_node("*[local-name()='S3ExportLocation']").try { |n| ExportTaskS3LocationRequest.from_xml(n) }.not_nil!,
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @s3_export_location
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @description, @disk_image_format, @dry_run, @image_id, @s3_export_location, @role_name, @tag_specifications)
  end
end
