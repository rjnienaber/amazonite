private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetEbsDefaultKmsKeyIdResult
    # The Amazon Resource Name (ARN) of the default KMS key for encryption by default.
    property kms_key_id : String | Nil

    def initialize(
      @kms_key_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@kms_key_id)
  end
end
