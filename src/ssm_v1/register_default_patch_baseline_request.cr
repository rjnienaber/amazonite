module Amazonite::SsmV1
  class RegisterDefaultPatchBaselineRequest
    include JSON::Serializable

    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    def initialize(
      @baseline_id : String
    )
    end
  end
end
