private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the destination for an export image task.
  class ExportTaskS3Location
    # The destination Amazon S3 bucket.
    property s3_bucket : String | Nil

    # The prefix (logical hierarchy) in the bucket.
    property s3_prefix : String | Nil

    def initialize(
      @s3_bucket : String | Nil = nil,
      @s3_prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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
        s3_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Bucket']")),
        s3_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@s3_bucket, @s3_prefix)
  end
end
