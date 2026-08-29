module Amazonite::SecretsManagerV1
  class PutSecretValueResponse
    include JSON::Serializable

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    @[JSON::Field(key: "VersionStages")]
    property version_stages : Array(String) | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @version_id : String | Nil = nil,
      @version_stages : Array(String) | Nil = nil,
    )
    end
  end
end
