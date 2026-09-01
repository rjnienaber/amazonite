private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class UpdateContinuousBackupsOutput
    include JSON::Serializable

    # Represents the continuous backups and point in time recovery settings on the table.
    @[JSON::Field(key: "ContinuousBackupsDescription")]
    property continuous_backups_description : ContinuousBackupsDescription | Nil

    def initialize(
      @continuous_backups_description : ContinuousBackupsDescription | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @continuous_backups_description
        value.validate!
      end
    end

    def_equals_and_hash(@continuous_backups_description)
  end
end
