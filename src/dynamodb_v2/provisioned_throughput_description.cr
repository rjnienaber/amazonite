private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ProvisionedThroughputDescription
    include JSON::Serializable

    @[JSON::Field(key: "LastIncreaseDateTime", converter: Core::AWSEpochConverter)]
    property last_increase_date_time : Time | Nil

    @[JSON::Field(key: "LastDecreaseDateTime", converter: Core::AWSEpochConverter)]
    property last_decrease_date_time : Time | Nil

    @[JSON::Field(key: "NumberOfDecreasesToday")]
    property number_of_decreases_today : Int64 | Nil

    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Int64 | Nil

    @[JSON::Field(key: "WriteCapacityUnits")]
    property write_capacity_units : Int64 | Nil

    def initialize(
      @last_increase_date_time : Time | Nil = nil,
      @last_decrease_date_time : Time | Nil = nil,
      @number_of_decreases_today : Int64 | Nil = nil,
      @read_capacity_units : Int64 | Nil = nil,
      @write_capacity_units : Int64 | Nil = nil
    )
    end
  end
end
