module Amazonite::SsmV1
  # The access details and targets for connecting to a Microsoft Azure tenant, including the
  # application registration used for authentication and the subscriptions to target.
  class AzureConfiguration
    include JSON::Serializable

    # The ID of the Azure tenant.
    @[JSON::Field(key: "TenantId")]
    property tenant_id : String

    # The display name of the Azure tenant.
    @[JSON::Field(key: "TenantDisplayName")]
    property tenant_display_name : String | Nil

    # The ID of the Azure application registration used for authentication.
    @[JSON::Field(key: "ApplicationId")]
    property application_id : String

    # The display name of the Azure application registration.
    @[JSON::Field(key: "ApplicationDisplayName")]
    property application_display_name : String | Nil

    # The target Azure subscriptions for the cloud connector.
    @[JSON::Field(key: "Targets")]
    property targets : ConfigurationTargets | Nil

    def initialize(
      @tenant_id : String,
      @application_id : String,
      @tenant_display_name : String | Nil = nil,
      @application_display_name : String | Nil = nil,
      @targets : ConfigurationTargets | Nil = nil,
    )
    end

    def_equals_and_hash(@tenant_id, @tenant_display_name, @application_id, @application_display_name, @targets)
  end
end
