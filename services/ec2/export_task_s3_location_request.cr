private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the destination for an export image task.
  class ExportTaskS3LocationRequest
    # The destination Amazon S3 bucket.
    property s3_bucket : String

    # The prefix (logical hierarchy) in the bucket.
    property s3_prefix : String | Nil

    def initialize(
      @s3_bucket : String,
      @s3_prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}S3Bucket", @s3_bucket}

      if value = @s3_prefix
        params << {"#{prefix}S3Prefix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='S3Bucket']")).not_nil!,
        s3_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='S3Prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@s3_bucket, @s3_prefix)
  end
end
