private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetDefaultPatchBaselineRequest
    include JSON::Serializable

    # Returns the default patch baseline for the specified operating system.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    def initialize(
      @operating_system : OperatingSystem | Nil = nil,
    )
    end
  end
end
