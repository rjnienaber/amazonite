private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for Amazon S3 as a logging destination.
  class VerifiedAccessLogS3DestinationOptions
    # Indicates whether logging is enabled.
    property enabled : Bool

    # The bucket name.
    property bucket_name : String | Nil

    # The bucket prefix.
    property prefix : String | Nil

    # The ID of the Amazon Web Services account that owns the Amazon S3 bucket.
    property bucket_owner : String | Nil

    def initialize(
      @enabled : Bool,
      @bucket_name : String | Nil = nil,
      @prefix : String | Nil = nil,
      @bucket_owner : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Enabled", Core::QueryValue.bool(@enabled)}

      if value = @bucket_name
        params << {"#{prefix}BucketName", value}
      end

      if value = @prefix
        params << {"#{prefix}Prefix", value}
      end

      if value = @bucket_owner
        params << {"#{prefix}BucketOwner", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")).not_nil!,
        bucket_name: Core::XMLValue.string(node.xpath_node("*[local-name()='BucketName']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        bucket_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='BucketOwner']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled, @bucket_name, @prefix, @bucket_owner)
  end
end
