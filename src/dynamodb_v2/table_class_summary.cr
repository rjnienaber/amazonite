private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class TableClassSummary
    include JSON::Serializable

    @[JSON::Field(key: "TableClass", converter: ADDB::TableClass)]
    property table_class : TableClass | Nil

    @[JSON::Field(key: "LastUpdateDateTime", converter: AC::AWSEpochConverter)]
    property last_update_date_time : Time | Nil

    def initialize(
      @table_class : TableClass | Nil = nil,
      @last_update_date_time : Time | Nil = nil
    )
    end
  end
end