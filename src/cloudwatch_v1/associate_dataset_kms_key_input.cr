module Amazonite::CloudWatchV1
  class AssociateDatasetKmsKeyInput
    include JSON::Serializable

    @[JSON::Field(key: "DatasetIdentifier")]
    property dataset_identifier : String

    @[JSON::Field(key: "KmsKeyArn")]
    property kms_key_arn : String

    def initialize(
      @dataset_identifier : String,
      @kms_key_arn : String,
    )
    end
  end
end
