module Amazonite::LambdaV1
  class RuntimeVersionConfig
    include JSON::Serializable

    @[JSON::Field(key: "RuntimeVersionArn")]
    property runtime_version_arn : String | Nil

    @[JSON::Field(key: "Error")]
    property error : RuntimeVersionError | Nil

    def initialize(
      @runtime_version_arn : String | Nil = nil,
      @error : RuntimeVersionError | Nil = nil,
    )
    end
  end
end
