module Amazonite::SsmV1
  class AzureConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "TenantId")]
    property tenant_id : String

    @[JSON::Field(key: "TenantDisplayName")]
    property tenant_display_name : String | Nil

    @[JSON::Field(key: "ApplicationId")]
    property application_id : String

    @[JSON::Field(key: "ApplicationDisplayName")]
    property application_display_name : String | Nil

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
  end
end
