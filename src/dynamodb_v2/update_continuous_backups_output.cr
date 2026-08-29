module Amazonite::DynamoDBV2
  class UpdateContinuousBackupsOutput
    include JSON::Serializable

    # Represents the continuous backups and point in time recovery settings on the table.
    @[JSON::Field(key: "ContinuousBackupsDescription")]
    property continuous_backups_description : ContinuousBackupsDescription | Nil

    def initialize(
      @continuous_backups_description : ContinuousBackupsDescription | Nil = nil,
    )
    end
  end
end
