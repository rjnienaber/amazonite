private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for Amazon S3 as a logging destination.
  class VerifiedAccessLogS3Destination
    # Indicates whether logging is enabled.
    property enabled : Bool | Nil

    # The delivery status.
    property delivery_status : VerifiedAccessLogDeliveryStatus | Nil

    # The bucket name.
    property bucket_name : String | Nil

    # The bucket prefix.
    property prefix : String | Nil

    # The Amazon Web Services account number that owns the bucket.
    property bucket_owner : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @delivery_status : VerifiedAccessLogDeliveryStatus | Nil = nil,
      @bucket_name : String | Nil = nil,
      @prefix : String | Nil = nil,
      @bucket_owner : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      if value = @delivery_status
        params.concat(value.to_query_params("#{prefix}DeliveryStatus."))
      end

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
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='enabled']")),
        delivery_status: node.xpath_node("*[local-name()='deliveryStatus']").try { |n| VerifiedAccessLogDeliveryStatus.from_xml(n) },
        bucket_name: Core::XMLValue.string(node.xpath_node("*[local-name()='bucketName']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='prefix']")),
        bucket_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='bucketOwner']")),
      )
    end

    def validate! : Nil
      if value = @delivery_status
        value.validate!
      end
    end

    def_equals_and_hash(@enabled, @delivery_status, @bucket_name, @prefix, @bucket_owner)
  end
end
