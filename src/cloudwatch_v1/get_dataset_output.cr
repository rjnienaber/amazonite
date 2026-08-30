private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @dataset_id
        raise Core::ValidationError.new("DatasetId length must be >= 7") if value.size < 7
        raise Core::ValidationError.new("DatasetId length must be <= 7") if value.size > 7
        raise Core::ValidationError.new("DatasetId does not match the required pattern") unless value.matches?(Regex.new("^default$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^arn:[a-zA-Z0-9-]+:cloudwatch:[a-zA-Z0-9-]*:\\d{12}:dataset/default$"))
      end

      if value = @kms_key_arn
        raise Core::ValidationError.new("KmsKeyArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("KmsKeyArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("KmsKeyArn does not match the required pattern") unless value.matches?(Regex.new("^arn:[a-zA-Z0-9-]+:kms:[a-zA-Z0-9-]+:\\d{12}:key/[a-f0-9-]+$"))
      end
    end

    def_equals_and_hash(@dataset_id, @arn, @kms_key_arn)
  end
end
