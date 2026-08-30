module Amazonite::CloudWatchV1
  class AssociateDatasetKmsKeyInput
    include JSON::Serializable

    # Specifies the identifier of the dataset that you want to associate the KMS key with. For the
    # `default` dataset, you can specify either `default` or the full dataset Amazon Resource Name
    # (ARN) in the format `arn:aws:cloudwatch:*Region*:*account-id*:dataset/default`.
    @[JSON::Field(key: "DatasetIdentifier")]
    property dataset_identifier : String

    # Specifies the Amazon Resource Name (ARN) of the customer managed KMS key to associate with the
    # dataset. The key must be a symmetric encryption KMS key (`SYMMETRIC_DEFAULT`) in the same Amazon
    # Web Services Region as the dataset.
    #
    # The ARN must be in the format `arn:aws:kms:*Region*:*account-id*:key/*key-id* `. Key IDs,
    # aliases, and alias ARNs are not accepted.
    #
    # For more information about KMS key ARNs, see [Key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN) in the
    # *Amazon Web Services Key Management Service Developer Guide*.
    @[JSON::Field(key: "KmsKeyArn")]
    property kms_key_arn : String

    def initialize(
      @dataset_identifier : String,
      @kms_key_arn : String,
    )
    end

    def_equals_and_hash(@dataset_identifier, @kms_key_arn)
  end
end
