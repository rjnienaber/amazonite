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

    def validate! : Nil
    end

    def_equals_and_hash(@policy)
  end
end
