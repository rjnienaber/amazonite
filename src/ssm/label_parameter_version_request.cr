private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 2048") if value.size > 2048
      end

      if value = @labels
        raise Core::ValidationError.new("Labels must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Labels must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@name, @parameter_version, @labels)
  end
end
