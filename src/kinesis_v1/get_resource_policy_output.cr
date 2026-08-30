module Amazonite::KinesisV1
  class GetResourcePolicyOutput
    include JSON::Serializable

    # Details of the resource policy. This is formatted as a JSON string.
    @[JSON::Field(key: "Policy")]
    property policy : String

    def initialize(
      @policy : String,
    )
    end
  end
end
