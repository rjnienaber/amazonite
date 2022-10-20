module Amazonite::DynamoDBv2
  class UpdateTimeToLiveInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "TimeToLiveSpecification")]
    property time_to_live_specification : TimeToLiveSpecification

    def initialize(
      @table_name : String,
      @time_to_live_specification : TimeToLiveSpecification
    )
    end
  end
end
