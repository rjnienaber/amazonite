private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # Specifies the tenant isolation mode configuration for a Lambda function. This allows you to
  # configure specific tenant isolation strategies for your function invocations. Tenant isolation
  # configuration cannot be modified after function creation.
  class TenancyConfig
    include JSON::Serializable

    # Tenant isolation mode allows for invocation to be sent to a corresponding execution environment
    # dedicated to a specific tenant ID.
    @[JSON::Field(key: "TenantIsolationMode", converter: AL::TenantIsolationMode)]
    property tenant_isolation_mode : TenantIsolationMode

    def initialize(
      @tenant_isolation_mode : TenantIsolationMode,
    )
    end

    def_equals_and_hash(@tenant_isolation_mode)
  end
end
