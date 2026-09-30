private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @tenant_id
        raise Core::ValidationError.new("TenantId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TenantId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("TenantId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @tenant_display_name
        raise Core::ValidationError.new("TenantDisplayName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TenantDisplayName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("TenantDisplayName does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end

      if value = @application_id
        raise Core::ValidationError.new("ApplicationId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ApplicationId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ApplicationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @application_display_name
        raise Core::ValidationError.new("ApplicationDisplayName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ApplicationDisplayName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ApplicationDisplayName does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end

      if value = @targets
        value.validate!
      end
    end

    def_equals_and_hash(@tenant_id, @tenant_display_name, @application_id, @application_display_name, @targets)
  end
end
