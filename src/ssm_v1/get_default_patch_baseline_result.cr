private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetDefaultPatchBaselineResult
    include JSON::Serializable

    # The ID of the default patch baseline.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String | Nil

    # The operating system for the returned patch baseline.
    @[JSON::Field(key: "OperatingSystem", converter: AS::OperatingSystem)]
    property operating_system : OperatingSystem | Nil

    def initialize(
      @baseline_id : String | Nil = nil,
      @operating_system : OperatingSystem | Nil = nil,
    )
    end

    def_equals_and_hash(@baseline_id, @operating_system)
  end
end
