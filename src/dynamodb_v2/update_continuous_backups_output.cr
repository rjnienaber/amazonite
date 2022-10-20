module Amazonite::DynamoDBv2
  class UpdateContinuousBackupsOutput
    include JSON::Serializable

    @[JSON::Field(key: "ContinuousBackupsDescription")]
    property continuous_backups_description : ContinuousBackupsDescription | Nil

    def initialize(
      @continuous_backups_description : ContinuousBackupsDescription | Nil = nil
    )
    end
  end
end