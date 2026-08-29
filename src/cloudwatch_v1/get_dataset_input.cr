module Amazonite::CloudWatchV1
  class GetDatasetInput
    include JSON::Serializable

    @[JSON::Field(key: "DatasetIdentifier")]
    property dataset_identifier : String

    def initialize(
      @dataset_identifier : String,
    )
    end
  end
end
