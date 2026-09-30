private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Amazon S3 bucket for the disk image.
  class UserBucketDetails
    # The Amazon S3 bucket from which the disk image was created.
    property s3_bucket : String | Nil

    # The file name of the disk image.
    property s3_key : String | Nil

    def initialize(
      @s3_bucket : String | Nil = nil,
      @s3_key : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @s3_bucket
        params << {"#{prefix}S3Bucket", value}
      end

      if value = @s3_key
        params << {"#{prefix}S3Key", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3_bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Bucket']")),
        s3_key: Core::XMLValue.string(node.xpath_node("*[local-name()='s3Key']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@s3_bucket, @s3_key)
  end
end
