module Amazonite::SsmV1
  class OpsItemIdentity
    include JSON::Serializable

    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil
    )
    end
  end
end
