module Amazonite::SsmV1
  # Information about the user or resource that created an OpsItem event.
  class OpsItemIdentity
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem event.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@arn)
  end
end
