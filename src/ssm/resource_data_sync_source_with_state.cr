private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The data type name for including resource data sync state. There are four sync states:
  #
  # `OrganizationNotExists` (Your organization doesn't exist)
  #
  # `NoPermissions` (The system can't locate the service-linked role. This role is automatically
  # created when a user creates a resource data sync in Amazon Web Services Systems Manager
  # Explorer.)
  #
  # `InvalidOrganizationalUnit` (You specified or selected an invalid unit in the resource data sync
  # configuration.)
  #
  # `TrustedAccessDisabled` (You disabled Systems Manager access in the organization in
  # Organizations.)
  class ResourceDataSyncSourceWithState
    include JSON::Serializable

    # The type of data source for the resource data sync. `SourceType` is either `AwsOrganizations`
    # (if an organization is present in Organizations) or `singleAccountMultiRegions`.
    @[JSON::Field(key: "SourceType")]
    property source_type : String | Nil

    # The field name in `SyncSource` for the `ResourceDataSyncAwsOrganizationsSource` type.
    @[JSON::Field(key: "AwsOrganizationsSource")]
    property aws_organizations_source : ResourceDataSyncAwsOrganizationsSource | Nil

    # The `SyncSource` Amazon Web Services Regions included in the resource data sync.
    @[JSON::Field(key: "SourceRegions")]
    property source_regions : Array(String) | Nil

    # Whether to automatically synchronize and aggregate data from new Amazon Web Services Regions
    # when those Regions come online.
    @[JSON::Field(key: "IncludeFutureRegions")]
    property include_future_regions : Bool | Nil

    # The data type name for including resource data sync state. There are four sync states:
    #
    # `OrganizationNotExists`: Your organization doesn't exist.
    #
    # `NoPermissions`: The system can't locate the service-linked role. This role is automatically
    # created when a user creates a resource data sync in Explorer.
    #
    # `InvalidOrganizationalUnit`: You specified or selected an invalid unit in the resource data sync
    # configuration.
    #
    # `TrustedAccessDisabled`: You disabled Systems Manager access in the organization in
    # Organizations.
    @[JSON::Field(key: "State")]
    property state : String | Nil

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
      @source_type : String | Nil = nil,
      @aws_organizations_source : ResourceDataSyncAwsOrganizationsSource | Nil = nil,
      @source_regions : Array(String) | Nil = nil,
      @include_future_regions : Bool | Nil = nil,
      @state : String | Nil = nil,
      @enable_all_ops_data_sources : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @source_type
        raise Core::ValidationError.new("SourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SourceType length must be <= 64") if value.size > 64
      end

      if value = @aws_organizations_source
        value.validate!
      end

      if value = @state
        raise Core::ValidationError.new("State length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("State length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@source_type, @aws_organizations_source, @source_regions, @include_future_regions, @state, @enable_all_ops_data_sources)
  end
end
