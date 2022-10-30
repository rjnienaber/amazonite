module Amazonite::DynamoDBV2
  class BackupDescription
    include JSON::Serializable

    @[JSON::Field(key: "BackupDetails")]
    property backup_details : BackupDetails | Nil

    @[JSON::Field(key: "SourceTableDetails")]
    property source_table_details : SourceTableDetails | Nil

    @[JSON::Field(key: "SourceTableFeatureDetails")]
    property source_table_feature_details : SourceTableFeatureDetails | Nil

    def initialize(
      @backup_details : BackupDetails | Nil = nil,
      @source_table_details : SourceTableDetails | Nil = nil,
      @source_table_feature_details : SourceTableFeatureDetails | Nil = nil
    )
    end
  end
end
