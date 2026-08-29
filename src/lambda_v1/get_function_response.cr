module Amazonite::LambdaV1
  class GetFunctionResponse
    include JSON::Serializable

    @[JSON::Field(key: "Configuration")]
    property configuration : FunctionConfiguration | Nil

    @[JSON::Field(key: "Code")]
    property code : FunctionCodeLocation | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    @[JSON::Field(key: "TagsError")]
    property tags_error : TagsError | Nil

    @[JSON::Field(key: "Concurrency")]
    property concurrency : Concurrency | Nil

    def initialize(
      @configuration : FunctionConfiguration | Nil = nil,
      @code : FunctionCodeLocation | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @tags_error : TagsError | Nil = nil,
      @concurrency : Concurrency | Nil = nil,
    )
    end
  end
end
