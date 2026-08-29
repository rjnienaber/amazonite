module Amazonite::LambdaV1
  class GetFunctionResponse
    include JSON::Serializable

    # The configuration of the function or version.
    @[JSON::Field(key: "Configuration")]
    property configuration : FunctionConfiguration | Nil

    # The deployment package of the function or version.
    @[JSON::Field(key: "Code")]
    property code : FunctionCodeLocation | Nil

    # The function's [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html). Lambda returns
    # tag data only if you have explicit allow permissions for
    # [lambda:ListTags](https://docs.aws.amazon.com/lambda/latest/api/API_ListTags.html).
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    # An object that contains details about an error related to retrieving tags.
    @[JSON::Field(key: "TagsError")]
    property tags_error : TagsError | Nil

    # The function's [reserved
    # concurrency](https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html).
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
