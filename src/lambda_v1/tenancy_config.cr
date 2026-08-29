private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class TenancyConfig
    include JSON::Serializable

    @[JSON::Field(key: "TenantIsolationMode", converter: AL::TenantIsolationMode)]
    property tenant_isolation_mode : TenantIsolationMode

    def initialize(
      @tenant_isolation_mode : TenantIsolationMode,
    )
    end
  end
end
