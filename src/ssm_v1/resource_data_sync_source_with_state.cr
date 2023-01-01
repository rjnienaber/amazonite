module Amazonite::SsmV1
  class ResourceDataSyncSourceWithState
    include JSON::Serializable

    @[JSON::Field(key: "SourceType")]
    property source_type : String | Nil

    @[JSON::Field(key: "AwsOrganizationsSource")]
    property aws_organizations_source : ResourceDataSyncAwsOrganizationsSource | Nil

    @[JSON::Field(key: "SourceRegions")]
    property source_regions : Array(String) | Nil

    @[JSON::Field(key: "IncludeFutureRegions")]
    property include_future_regions : Bool | Nil

    @[JSON::Field(key: "State")]
    property state : String | Nil

    @[JSON::Field(key: "EnableAllOpsDataSources")]
    property enable_all_ops_data_sources : Bool | Nil

    def initialize(
      @source_type : String | Nil = nil,
      @aws_organizations_source : ResourceDataSyncAwsOrganizationsSource | Nil = nil,
      @source_regions : Array(String) | Nil = nil,
      @include_future_regions : Bool | Nil = nil,
      @state : String | Nil = nil,
      @enable_all_ops_data_sources : Bool | Nil = nil
    )
    end
  end
end
