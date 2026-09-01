private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class GetDatasetInput
    include JSON::Serializable

    # Specifies the identifier of the dataset to retrieve. For the `default` dataset, you can specify
    # either `default` or the full dataset Amazon Resource Name (ARN) in the format
    # `arn:aws:cloudwatch:*Region*:*account-id*:dataset/default`.
    @[JSON::Field(key: "DatasetIdentifier")]
    property dataset_identifier : String

    def initialize(
      @dataset_identifier : String,
    )
    end

    def validate! : Nil
      if value = @dataset_identifier
        raise Core::ValidationError.new("DatasetIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DatasetIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("DatasetIdentifier does not match the required pattern") unless value.matches?(Regex.new("^(default|arn:[a-zA-Z0-9-]+:cloudwatch:[a-zA-Z0-9-]*:\\d{12}:dataset/default)$"))
      end
    end

    def_equals_and_hash(@dataset_identifier)
  end
end
