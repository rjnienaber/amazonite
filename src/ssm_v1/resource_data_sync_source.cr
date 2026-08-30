module Amazonite::SsmV1
  # Information about the source of the data included in the resource data sync.
  class ResourceDataSyncSource
    include JSON::Serializable

    # The type of data source for the resource data sync. `SourceType` is either `AwsOrganizations`
    # (if an organization is present in Organizations) or `SingleAccountMultiRegions`.
    @[JSON::Field(key: "SourceType")]
    property source_type : String

    # Information about the `AwsOrganizationsSource` resource data sync source. A sync source of this
    # type can synchronize data from Organizations.
    @[JSON::Field(key: "AwsOrganizationsSource")]
    property aws_organizations_source : ResourceDataSyncAwsOrganizationsSource | Nil

    # The `SyncSource` Amazon Web Services Regions included in the resource data sync.
    @[JSON::Field(key: "SourceRegions")]
    property source_regions : Array(String) = [] of String

    # Whether to automatically synchronize and aggregate data from new Amazon Web Services Regions
    # when those Regions come online.
    @[JSON::Field(key: "IncludeFutureRegions")]
    property include_future_regions : Bool | Nil

    # When you create a resource data sync, if you choose one of the Organizations options, then
    # Systems Manager automatically enables all OpsData sources in the selected Amazon Web Services
    # Regions for all Amazon Web Services accounts in your organization (or in the selected
    # organization units). For more information, see [Setting up Systems Manager Explorer to display
    # data from multiple accounts and
    # Regions](https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "EnableAllOpsDataSources")]
    property enable_all_ops_data_sources : Bool | Nil

    def initialize(
      @source_type : String,
      @source_regions : Array(String),
      @aws_organizations_source : ResourceDataSyncAwsOrganizationsSource | Nil = nil,
      @include_future_regions : Bool | Nil = nil,
      @enable_all_ops_data_sources : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@source_type, @aws_organizations_source, @source_regions, @include_future_regions, @enable_all_ops_data_sources)
  end
end
