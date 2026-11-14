private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The access details and targets for connecting to a Google Cloud Platform (GCP) environment,
  # including the workload identity pool provider and service account used for authentication and
  # the projects to target.
  class GcpConfiguration
    include JSON::Serializable

    # The ID of the GCP organization.
    @[JSON::Field(key: "OrganizationId")]
    property organization_id : String | Nil

    # The full resource name of the GCP workload identity pool provider used for authentication.
    @[JSON::Field(key: "WorkloadIdentityPoolProvider")]
    property workload_identity_pool_provider : String

    # The email address of the GCP service account used for authentication.
    @[JSON::Field(key: "ServiceAccountEmail")]
    property service_account_email : String

    # The target GCP projects for the cloud connector.
    @[JSON::Field(key: "Targets")]
    property targets : GcpConfigurationTargets | Nil

    def initialize(
      @workload_identity_pool_provider : String,
      @service_account_email : String,
      @organization_id : String | Nil = nil,
      @targets : GcpConfigurationTargets | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @organization_id
        raise Core::ValidationError.new("OrganizationId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OrganizationId length must be <= 19") if value.size > 19
        raise Core::ValidationError.new("OrganizationId does not match the required pattern") unless value.matches?(Regex.new("^[1-9][0-9]{0,18}$"))
      end

      if value = @workload_identity_pool_provider
        raise Core::ValidationError.new("WorkloadIdentityPoolProvider length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("WorkloadIdentityPoolProvider length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("WorkloadIdentityPoolProvider does not match the required pattern") unless value.matches?(Regex.new("^projects/[1-9][0-9]{0,18}/locations/global/workloadIdentityPools\\/[a-z0-9-]{4,32}/providers/[a-z0-9-]{4,32}$"))
      end

      if value = @service_account_email
        raise Core::ValidationError.new("ServiceAccountEmail length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ServiceAccountEmail length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ServiceAccountEmail does not match the required pattern") unless value.matches?(Regex.new("^[a-z][a-z0-9\\-]*[a-z0-9]@[a-z][a-z0-9\\-]*[a-z0-9]\\.iam\\.gserviceaccount\\.com$"))
      end

      if value = @targets
        value.validate!
      end
    end

    def_equals_and_hash(@organization_id, @workload_identity_pool_provider, @service_account_email, @targets)
  end
end
