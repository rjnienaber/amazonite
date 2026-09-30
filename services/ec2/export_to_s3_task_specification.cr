private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an export instance task.
  class ExportToS3TaskSpecification
    # The format for the exported image.
    property disk_image_format : DiskImageFormat | Nil

    # The container format used to combine disk images with metadata (such as OVF). If absent, only
    # the disk image is exported.
    property container_format : ContainerFormat | Nil

    # The Amazon S3 bucket for the destination image. The destination bucket must exist and have an
    # access control list (ACL) attached that specifies the Region-specific canonical account ID for
    # the `Grantee`. For more information about the ACL to your S3 bucket, see
    # [Prerequisites](https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport.html#vmexport-prerequisites)
    # in the VM Import/Export User Guide.
    property s3_bucket : String | Nil

    # The image is written to a single object in the Amazon S3 bucket at the S3 key s3prefix +
    # exportTaskId + '.' + diskImageFormat.
    property s3_prefix : String | Nil

    def initialize(
      @disk_image_format : DiskImageFormat | Nil = nil,
      @container_format : ContainerFormat | Nil = nil,
      @s3_bucket : String | Nil = nil,
      @s3_prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @disk_image_format
        params << {"#{prefix}DiskImageFormat", value.to_json_object_key}
      end

      if value = @container_format
        params << {"#{prefix}ContainerFormat", value.to_json_object_key}
      end

      if value = @s3_bucket
        params << {"#{prefix}S3Bucket", value}
      end

      if value = @s3_prefix
        params << {"#{prefix}S3Prefix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        disk_image_format: (n = node.xpath_node("*[local-name()='diskImageFormat']")) ? AEC::DiskImageFormat.from_json_object_key?(n.content) : nil,
        container_format: (n = node.xpath_node("*[local-name()='containerFormat']")) ? AEC::ContainerFormat.from_json_object_key?(n.content) : nil,
        s3_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Bucket']")),
        s3_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@disk_image_format, @container_format, @s3_bucket, @s3_prefix)
  end
end
