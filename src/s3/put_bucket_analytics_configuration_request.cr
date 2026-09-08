private alias Core = Amazonite::Core

module Amazonite::S3
  class PutBucketAnalyticsConfigurationRequest
    # The name of the bucket to which an analytics configuration is stored.
    property bucket : String = ""

    # The ID that identifies the analytics configuration.
    property id : String = ""

    # The configuration and any analyses for the analytics filter.
    property analytics_configuration : AnalyticsConfiguration

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @id : String,
      @analytics_configuration : AnalyticsConfiguration,
      @expected_bucket_owner : String | Nil = nil,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def validate! : Nil
      if value = @analytics_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @id, @analytics_configuration, @expected_bucket_owner)
  end
end
