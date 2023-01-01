module Amazonite::SsmV1
  class LabelParameterVersionRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "ParameterVersion")]
    property parameter_version : Int64 | Nil

    @[JSON::Field(key: "Labels")]
    property labels : Array(String)

    def initialize(
      @name : String,
      @labels : Array(String),
      @parameter_version : Int64 | Nil = nil
    )
    end
  end
end
