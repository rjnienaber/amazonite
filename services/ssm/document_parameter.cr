private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  # Parameters specified in a Systems Manager document that run on the server when the command is
  # run.
  class DocumentParameter
    include JSON::Serializable

    # The name of the parameter.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The type of parameter. The type can be either String or StringList.
    @[JSON::Field(key: "Type", converter: AS::DocumentParameterType)]
    property type : DocumentParameterType | Nil

    # A description of what the parameter does, how to use it, the default value, and whether or not
    # the parameter is optional.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # If specified, the default values for the parameters. Parameters without a default value are
    # required. Parameters with a default value are optional.
    @[JSON::Field(key: "DefaultValue")]
    property default_value : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @type : DocumentParameterType | Nil = nil,
      @description : String | Nil = nil,
      @default_value : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@name, @type, @description, @default_value)
  end
end
