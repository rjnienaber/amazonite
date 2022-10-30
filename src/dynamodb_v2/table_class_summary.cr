private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class TableClassSummary
    include JSON::Serializable

    @[JSON::Field(key: "TableClass", converter: ADDB::TableClass)]
    property table_class : TableClass | Nil

    @[JSON::Field(key: "LastUpdateDateTime", converter: Core::AWSEpochConverter)]
    property last_update_date_time : Time | Nil

    def initialize(
      @table_class : TableClass | Nil = nil,
      @last_update_date_time : Time | Nil = nil
    )
    end
  end
end
