module Amazonite::SsmV1
  class LabelParameterVersionRequest
    include JSON::Serializable

    # The parameter name on which you want to attach one or more labels.
    #
    # You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
    @[JSON::Field(key: "Name")]
    property name : String

    # The specific version of the parameter on which you want to attach one or more labels. If no
    # version is specified, the system attaches the label to the latest version.
    @[JSON::Field(key: "ParameterVersion")]
    property parameter_version : Int64 | Nil

    # One or more labels to attach to the specified parameter version.
    @[JSON::Field(key: "Labels")]
    property labels : Array(String) = [] of String

    def initialize(
      @name : String,
      @labels : Array(String),
      @parameter_version : Int64 | Nil = nil,
    )
    end
  end
end
