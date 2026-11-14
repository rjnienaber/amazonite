private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The target resources in the GCP environment.
  class GcpConfigurationTargets
    include JSON::Serializable

    # A list of GCP projects to target.
    @[JSON::Field(key: "Projects")]
    property projects : Array(GcpProject) | Nil

    def initialize(
      @projects : Array(GcpProject) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @projects
        raise Core::ValidationError.new("Projects must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Projects must have at most 75 item(s)") if value.size > 75
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@projects)
  end
end
