private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class DeleteSecretResponse
    include JSON::Serializable

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "DeletionDate", converter: Core::AWSEpochConverter)]
    property deletion_date : Time | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @deletion_date : Time | Nil = nil,
    )
    end
  end
end
