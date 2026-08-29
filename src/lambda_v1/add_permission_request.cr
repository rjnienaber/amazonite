private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class AddPermissionRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "StatementId")]
    property statement_id : String

    @[JSON::Field(key: "Action")]
    property action : String

    @[JSON::Field(key: "Principal")]
    property principal : String

    @[JSON::Field(key: "SourceArn")]
    property source_arn : String | Nil

    @[JSON::Field(key: "FunctionUrlAuthType", converter: AL::FunctionUrlAuthType)]
    property function_url_auth_type : FunctionUrlAuthType | Nil

    @[JSON::Field(key: "InvokedViaFunctionUrl")]
    property invoked_via_function_url : Bool | Nil

    @[JSON::Field(key: "SourceAccount")]
    property source_account : String | Nil

    @[JSON::Field(key: "EventSourceToken")]
    property event_source_token : String | Nil

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    @[JSON::Field(key: "PrincipalOrgID")]
    property principal_org_id : String | Nil

    def initialize(
      @function_name : String,
      @statement_id : String,
      @action : String,
      @principal : String,
      @source_arn : String | Nil = nil,
      @function_url_auth_type : FunctionUrlAuthType | Nil = nil,
      @invoked_via_function_url : Bool | Nil = nil,
      @source_account : String | Nil = nil,
      @event_source_token : String | Nil = nil,
      @qualifier : String | Nil = nil,
      @revision_id : String | Nil = nil,
      @principal_org_id : String | Nil = nil,
    )
    end
  end
end
