module Amazonite::CloudWatchV1
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
  end
end
