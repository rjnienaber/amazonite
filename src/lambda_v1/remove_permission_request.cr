module Amazonite::LambdaV1
  class RemovePermissionRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "StatementId", ignore: true)]
    property statement_id : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    @[JSON::Field(key: "RevisionId", ignore: true)]
    property revision_id : String | Nil

    def initialize(
      @function_name : String,
      @statement_id : String,
      @qualifier : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
