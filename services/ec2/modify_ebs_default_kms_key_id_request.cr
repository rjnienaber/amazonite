private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyEbsDefaultKmsKeyIdRequest
    # The identifier of the KMS key to use for Amazon EBS encryption. If this parameter is not
    # specified, your KMS key for Amazon EBS is used. If `KmsKeyId` is specified, the encrypted state
    # must be `true`.
    #
    # You can specify the KMS key using any of the following:
    #
    # - Key ID. For example, 1234abcd-12ab-34cd-56ef-1234567890ab.
    #
    # - Key alias. For example, alias/ExampleAlias.
    #
    # - Key ARN. For example,
    # arn:aws:kms:us-east-1:012345678910:key/1234abcd-12ab-34cd-56ef-1234567890ab.
    #
    # - Alias ARN. For example, arn:aws:kms:us-east-1:012345678910:alias/ExampleAlias.
    #
    # Amazon Web Services authenticates the KMS key asynchronously. Therefore, if you specify an ID,
    # alias, or ARN that is not valid, the action can appear to complete, but eventually fails.
    #
    # Amazon EBS does not support asymmetric KMS keys.
    property kms_key_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @kms_key_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}KmsKeyId", @kms_key_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@kms_key_id, @dry_run)
  end
end
