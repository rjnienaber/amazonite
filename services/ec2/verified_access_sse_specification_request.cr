private alias Core = Amazonite::Core

module Amazonite::EC2
  # Verified Access provides server side encryption by default to data at rest using Amazon Web
  # Services-owned KMS keys. You also have the option of using customer managed KMS keys, which can
  # be specified using the options below.
  class VerifiedAccessSseSpecificationRequest
    # Enable or disable the use of customer managed KMS keys for server side encryption.
    #
    # Valid values: `True` | `False`
    property customer_managed_key_enabled : Bool | Nil

    # The ARN of the KMS key.
    property kms_key_arn : String | Nil

    def initialize(
      @customer_managed_key_enabled : Bool | Nil = nil,
      @kms_key_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @customer_managed_key_enabled
        params << {"#{prefix}CustomerManagedKeyEnabled", Core::QueryValue.bool(value)}
      end

      if value = @kms_key_arn
        params << {"#{prefix}KmsKeyArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        customer_managed_key_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='CustomerManagedKeyEnabled']")),
        kms_key_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@customer_managed_key_enabled, @kms_key_arn)
  end
end
