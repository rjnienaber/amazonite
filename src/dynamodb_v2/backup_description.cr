private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains the description of the backup created for the table.
  class BackupDescription
    include JSON::Serializable

    # Contains the details of the backup created for the table.
    @[JSON::Field(key: "BackupDetails")]
    property backup_details : BackupDetails | Nil

    # Contains the details of the table when the backup was created.
    @[JSON::Field(key: "SourceTableDetails")]
    property source_table_details : SourceTableDetails | Nil

    # Contains the details of the features enabled on the table when the backup was created. For
    # example, LSIs, GSIs, streams, TTL.
    @[JSON::Field(key: "SourceTableFeatureDetails")]
    property source_table_feature_details : SourceTableFeatureDetails | Nil

    def initialize(
      @backup_details : BackupDetails | Nil = nil,
      @source_table_details : SourceTableDetails | Nil = nil,
      @source_table_feature_details : SourceTableFeatureDetails | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @backup_details
        value.validate!
      end

      if value = @source_table_details
        value.validate!
      end

      if value = @source_table_feature_details
        value.validate!
      end
    end

    def_equals_and_hash(@backup_details, @source_table_details, @source_table_feature_details)
  end
end
