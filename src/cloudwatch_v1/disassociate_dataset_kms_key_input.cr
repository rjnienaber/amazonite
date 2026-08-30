module Amazonite::CloudWatchV1
  class DisassociateDatasetKmsKeyInput
    include JSON::Serializable

    # Specifies the identifier of the dataset from which to remove the KMS key association. For the
    # `default` dataset, you can specify either `default` or the full dataset Amazon Resource Name
    # (ARN) in the format `arn:aws:cloudwatch:*Region*:*account-id*:dataset/default`.
    @[JSON::Field(key: "DatasetIdentifier")]
    property dataset_identifier : String

    def initialize(
      @dataset_identifier : String,
    )
    end

    def_equals_and_hash(@dataset_identifier)
  end
end
