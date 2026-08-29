private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains details of the table class.
  class TableClassSummary
    include JSON::Serializable

    # The table class of the specified table. Valid values are `STANDARD` and
    # `STANDARD_INFREQUENT_ACCESS`.
    @[JSON::Field(key: "TableClass", converter: ADDB::TableClass)]
    property table_class : TableClass | Nil

    # The date and time at which the table class was last updated.
    @[JSON::Field(key: "LastUpdateDateTime", converter: Core::AWSEpochConverter)]
    property last_update_date_time : Time | Nil

    def initialize(
      @table_class : TableClass | Nil = nil,
      @last_update_date_time : Time | Nil = nil,
    )
    end
  end
end
