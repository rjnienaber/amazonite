private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  class GetDefaultPatchBaselineRequest
    include JSON::Serializable

    # Returns the default patch baseline for the specified operating system.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    def initialize(
      @operating_system : OperatingSystem | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@operating_system)
  end
end
