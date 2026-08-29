module Amazonite::CloudWatchV1
  class GetDatasetOutput
    include JSON::Serializable

    @[JSON::Field(key: "DatasetId")]
    property dataset_id : String

    @[JSON::Field(key: "Arn")]
    property arn : String

    @[JSON::Field(key: "KmsKeyArn")]
    property kms_key_arn : String | Nil

    def initialize(
      @dataset_id : String,
      @arn : String,
      @kms_key_arn : String | Nil = nil,
    )
    end
  end
end
