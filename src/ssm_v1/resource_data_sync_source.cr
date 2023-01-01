module Amazonite::SsmV1
  class ResourceDataSyncSource
    include JSON::Serializable

    @[JSON::Field(key: "SourceType")]
    property source_type : String

    @[JSON::Field(key: "AwsOrganizationsSource")]
    property aws_organizations_source : ResourceDataSyncAwsOrganizationsSource | Nil

    @[JSON::Field(key: "SourceRegions")]
    property source_regions : Array(String)

    @[JSON::Field(key: "IncludeFutureRegions")]
    property include_future_regions : Bool | Nil

    @[JSON::Field(key: "EnableAllOpsDataSources")]
    property enable_all_ops_data_sources : Bool | Nil

    def initialize(
      @source_type : String,
      @source_regions : Array(String),
      @aws_organizations_source : ResourceDataSyncAwsOrganizationsSource | Nil = nil,
      @include_future_regions : Bool | Nil = nil,
      @enable_all_ops_data_sources : Bool | Nil = nil
    )
    end
  end
end
