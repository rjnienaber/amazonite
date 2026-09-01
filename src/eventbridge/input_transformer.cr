private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # Contains the parameters needed for you to provide custom input to a target based on one or more
  # pieces of data extracted from the event.
  class InputTransformer
    include JSON::Serializable

    # Map of JSON paths to be extracted from the event. You can then insert these in the template in
    # `InputTemplate` to produce the output you want to be sent to the target.
    #
    # `InputPathsMap` is an array key-value pairs, where each value is a valid JSON path. You can have
    # as many as 100 key-value pairs. You must use JSON dot notation, not bracket notation.
    #
    # The keys cannot start with "Amazon Web Services."
    @[JSON::Field(key: "InputPathsMap")]
    property input_paths_map : Hash(String, String) | Nil

    # Input template where you specify placeholders that will be filled with the values of the keys
    # from `InputPathsMap` to customize the data sent to the target. Enclose each `InputPathsMaps`
    # value in brackets:
    #
    # If `InputTemplate` is a JSON object (surrounded by curly braces), the following restrictions
    # apply:
    #
    # - The placeholder cannot be used as an object key.
    #
    # The following example shows the syntax for using `InputPathsMap` and `InputTemplate`.
    #
    # ` "InputTransformer":`
    #
    # `{`
    #
    # `"InputPathsMap": {"instance": "$.detail.instance","status": "$.detail.status"},`
    #
    # `"InputTemplate": " is in state "`
    #
    # `}`
    #
    # To have the `InputTemplate` include quote marks within a JSON string, escape each quote marks
    # with a slash, as in the following example:
    #
    # ` "InputTransformer":`
    #
    # `{`
    #
    # `"InputPathsMap": {"instance": "$.detail.instance","status": "$.detail.status"},`
    #
    # `"InputTemplate": " is in state \"\""`
    #
    # `}`
    #
    # The `InputTemplate` can also be valid JSON with varibles in quotes or out, as in the following
    # example:
    #
    # ` "InputTransformer":`
    #
    # `{`
    #
    # `"InputPathsMap": {"instance": "$.detail.instance","status": "$.detail.status"},`
    #
    # `"InputTemplate": '{"myInstance": ,"myStatus": " is in state \"\""}'`
    #
    # `}`
    @[JSON::Field(key: "InputTemplate")]
    property input_template : String

    def initialize(
      @input_template : String,
      @input_paths_map : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @input_paths_map
        raise Core::ValidationError.new("InputPathsMap must have at least 0 entry(s)") if value.size < 0
        raise Core::ValidationError.new("InputPathsMap must have at most 100 entry(s)") if value.size > 100
      end

      if value = @input_template
        raise Core::ValidationError.new("InputTemplate length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("InputTemplate length must be <= 8192") if value.size > 8192
      end
    end

    def_equals_and_hash(@input_paths_map, @input_template)
  end
end
