private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  class AddPermissionRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function, version, or alias.
    #
    # **Name formats**
    #
    # - **Function name** – `my-function` (name-only), `my-function:v1` (with alias).
    #
    # - **Function ARN** – `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
    #
    # - **Partial ARN** – `123456789012:function:my-function`.
    #
    # You can append a version number or alias to any of the formats. The length constraint applies
    # only to the full ARN. If you specify only the function name, it is limited to 64 characters in
    # length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # A statement identifier that differentiates the statement from others in the same policy.
    @[JSON::Field(key: "StatementId")]
    property statement_id : String

    # The action that the principal can use on the function. For example, `lambda:InvokeFunction` or
    # `lambda:GetFunction`.
    @[JSON::Field(key: "Action")]
    property action : String

    # The Amazon Web Services service, Amazon Web Services account, IAM user, or IAM role that invokes
    # the function. If you specify a service, use `SourceArn` or `SourceAccount` to limit who can
    # invoke the function through that service.
    @[JSON::Field(key: "Principal")]
    property principal : String

    # For Amazon Web Services services, the ARN of the Amazon Web Services resource that invokes the
    # function. For example, an Amazon S3 bucket or Amazon SNS topic.
    #
    # Note that Lambda configures the comparison using the `StringLike` operator.
    @[JSON::Field(key: "SourceArn")]
    property source_arn : String | Nil

    # The type of authentication that your function URL uses. Set to `AWS_IAM` if you want to restrict
    # access to authenticated users only. Set to `NONE` if you want to bypass IAM authentication to
    # create a public endpoint. For more information, see [Control access to Lambda function
    # URLs](https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html).
    @[JSON::Field(key: "FunctionUrlAuthType", converter: AL::FunctionUrlAuthType)]
    property function_url_auth_type : FunctionUrlAuthType | Nil

    # Indicates whether the permission applies when the function is invoked through a function URL.
    @[JSON::Field(key: "InvokedViaFunctionUrl")]
    property invoked_via_function_url : Bool | Nil

    # For Amazon Web Services service, the ID of the Amazon Web Services account that owns the
    # resource. Use this together with `SourceArn` to ensure that the specified account owns the
    # resource. It is possible for an Amazon S3 bucket to be deleted by its owner and recreated by
    # another account.
    @[JSON::Field(key: "SourceAccount")]
    property source_account : String | Nil

    # For Alexa Smart Home functions, a token that the invoker must supply.
    @[JSON::Field(key: "EventSourceToken")]
    property event_source_token : String | Nil

    # Specify a version or alias to add permissions to a published version of the function.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    # Update the policy only if the revision ID matches the ID that's specified. Use this option to
    # avoid modifying a policy that has changed since you last read it.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    # The identifier for your organization in Organizations. Use this to grant permissions to all the
    # Amazon Web Services accounts under this organization.
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

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:|(((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?))(function:)?([a-zA-Z0-9-_\\.]+)(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @statement_id
        raise Core::ValidationError.new("StatementId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatementId length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("StatementId does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z0-9-_]+)$"))
      end

      if value = @action
        raise Core::ValidationError.new("Action length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Action length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("Action does not match the required pattern") unless value.matches?(Regex.new("^(lambda:[*]|lambda:[a-zA-Z]+|[*])$"))
      end

      if value = @principal
        raise Core::ValidationError.new("Principal length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Principal length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Principal does not match the required pattern") unless value.matches?(Regex.new("^[^\\s]+$"))
      end

      if value = @source_arn
        raise Core::ValidationError.new("SourceArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SourceArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("SourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\-])+:((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1})?:(\\d{12})?:(.*)$"))
      end

      if value = @source_account
        raise Core::ValidationError.new("SourceAccount length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SourceAccount length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("SourceAccount does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end

      if value = @event_source_token
        raise Core::ValidationError.new("EventSourceToken length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventSourceToken length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("EventSourceToken does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9._\\-]+$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^\\$(LATEST(\\.PUBLISHED)?)|[a-zA-Z0-9-_$]+$"))
      end

      if value = @principal_org_id
        raise Core::ValidationError.new("PrincipalOrgID length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("PrincipalOrgID length must be <= 34") if value.size > 34
        raise Core::ValidationError.new("PrincipalOrgID does not match the required pattern") unless value.matches?(Regex.new("^o-[a-z0-9]{10,32}$"))
      end
    end

    def_equals_and_hash(@function_name, @statement_id, @action, @principal, @source_arn, @function_url_auth_type, @invoked_via_function_url, @source_account, @event_source_token, @qualifier, @revision_id, @principal_org_id)
  end
end
