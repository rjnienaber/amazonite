private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # An update to be applied to an operation during checkpointing.
  class OperationUpdate
    include JSON::Serializable

    # The unique identifier for this operation.
    @[JSON::Field(key: "Id")]
    property id : String

    # The unique identifier of the parent operation, if this operation is running within a child
    # context.
    @[JSON::Field(key: "ParentId")]
    property parent_id : String | Nil

    # The customer-provided name for this operation.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The type of operation to update.
    @[JSON::Field(key: "Type", converter: AL::OperationType)]
    property type : OperationType

    # The subtype of the operation, providing additional categorization.
    @[JSON::Field(key: "SubType")]
    property sub_type : String | Nil

    # The action to take on the operation.
    @[JSON::Field(key: "Action", converter: AL::OperationAction)]
    property action : OperationAction

    # The payload for successful operations. The maximum payload size is 6 MB for synchronous
    # `EXECUTION` operations (RequestResponse invocationType), 1 MB for asynchronous `EXECUTION`
    # (Event invocationType) and `CHAINED_INVOKE` operations, and 256 KB for `CONTEXT`, `STEP`,
    # `WAIT`, and `CALLBACK` operations.
    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    # The error information for failed operations.
    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    # Options for context operations.
    @[JSON::Field(key: "ContextOptions")]
    property context_options : ContextOptions | Nil

    # Options for step operations.
    @[JSON::Field(key: "StepOptions")]
    property step_options : StepOptions | Nil

    # Options for wait operations.
    @[JSON::Field(key: "WaitOptions")]
    property wait_options : WaitOptions | Nil

    @[JSON::Field(key: "CallbackOptions")]
    property callback_options : CallbackOptions | Nil

    @[JSON::Field(key: "ChainedInvokeOptions")]
    property chained_invoke_options : ChainedInvokeOptions | Nil

    def initialize(
      @id : String,
      @type : OperationType,
      @action : OperationAction,
      @parent_id : String | Nil = nil,
      @name : String | Nil = nil,
      @sub_type : String | Nil = nil,
      @payload : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
      @context_options : ContextOptions | Nil = nil,
      @step_options : StepOptions | Nil = nil,
      @wait_options : WaitOptions | Nil = nil,
      @callback_options : CallbackOptions | Nil = nil,
      @chained_invoke_options : ChainedInvokeOptions | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Id length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_]+$"))
      end

      if value = @parent_id
        raise Core::ValidationError.new("ParentId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ParentId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("ParentId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_]+$"))
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\x20-\\x7E]+$"))
      end

      if value = @sub_type
        raise Core::ValidationError.new("SubType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SubType length must be <= 32") if value.size > 32
        raise Core::ValidationError.new("SubType does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_]+$"))
      end

      if value = @payload
        raise Core::ValidationError.new("Payload length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Payload length must be <= 6291456") if value.size > 6291456
      end

      if value = @error
        value.validate!
      end

      if value = @context_options
        value.validate!
      end

      if value = @step_options
        value.validate!
      end

      if value = @wait_options
        value.validate!
      end

      if value = @callback_options
        value.validate!
      end

      if value = @chained_invoke_options
        value.validate!
      end
    end

    def_equals_and_hash(@id, @parent_id, @name, @type, @sub_type, @action, @payload, @error, @context_options, @step_options, @wait_options, @callback_options, @chained_invoke_options)
  end
end
