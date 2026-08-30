private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class UnlabelParameterVersionRequest
    include JSON::Serializable

    # The name of the parameter from which you want to delete one or more labels.
    #
    # You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
    @[JSON::Field(key: "Name")]
    property name : String

    # The specific version of the parameter which you want to delete one or more labels from. If it
    # isn't present, the call will fail.
    @[JSON::Field(key: "ParameterVersion")]
    property parameter_version : Int64

    # One or more labels to delete from the specified parameter version.
    @[JSON::Field(key: "Labels")]
    property labels : Array(String) = [] of String

    def initialize(
      @name : String,
      @parameter_version : Int64,
      @labels : Array(String),
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
