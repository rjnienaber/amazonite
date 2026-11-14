private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Information about a GCP project targeted by the cloud connector.
  class GcpProject
    include JSON::Serializable

    # The ID of the GCP project.
    @[JSON::Field(key: "ProjectId")]
    property project_id : String

    # The display name of the GCP project.
    @[JSON::Field(key: "ProjectDisplayName")]
    property project_display_name : String | Nil

    def initialize(
      @project_id : String,
      @project_display_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @project_id
        raise Core::ValidationError.new("ProjectId length must be >= 6") if value.size < 6
        raise Core::ValidationError.new("ProjectId length must be <= 30") if value.size > 30
        raise Core::ValidationError.new("ProjectId does not match the required pattern") unless value.matches?(Regex.new("^[a-z][a-z0-9-]{4,28}[a-z0-9]$"))
      end

      if value = @project_display_name
        raise Core::ValidationError.new("ProjectDisplayName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ProjectDisplayName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ProjectDisplayName does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}\\p{P}\\p{M}]*)$"))
      end
    end

    def_equals_and_hash(@project_id, @project_display_name)
  end
end
