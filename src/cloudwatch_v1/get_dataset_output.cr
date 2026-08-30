module Amazonite::CloudWatchV1
  class GetDatasetOutput
    include JSON::Serializable

    # Returns the identifier of the dataset.
    @[JSON::Field(key: "DatasetId")]
    property dataset_id : String

    # Returns the Amazon Resource Name (ARN) of the dataset, in the format
    # `arn:aws:cloudwatch:*Region*:*account-id*:dataset/*dataset-id* `.
    @[JSON::Field(key: "Arn")]
    property arn : String

    # Returns the Amazon Resource Name (ARN) of the customer managed Amazon Web Services KMS key that
    # is currently associated with the dataset, if any. If the dataset is not associated with a
    # customer managed KMS key, this field is not included in the response and the dataset is
    # encrypted at rest using an Amazon Web Services owned key.
    @[JSON::Field(key: "KmsKeyArn")]
    property kms_key_arn : String | Nil

    def initialize(
      @dataset_id : String,
      @arn : String,
      @kms_key_arn : String | Nil = nil,
    )
    end

    def_equals_and_hash(@dataset_id, @arn, @kms_key_arn)
  end
end
