private alias Core = Amazonite::Core

module Amazonite::EC2
  # The options in use for server side encryption.
  class VerifiedAccessSseSpecificationResponse
    # Indicates whether customer managed KMS keys are in use for server side encryption.
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
        customer_managed_key_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='customerManagedKeyEnabled']")),
        kms_key_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@customer_managed_key_enabled, @kms_key_arn)
  end
end
