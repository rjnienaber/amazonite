module Amazonite::SsmV1
  class UnlabelParameterVersionRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "ParameterVersion")]
    property parameter_version : Int64

    @[JSON::Field(key: "Labels")]
    property labels : Array(String)

    def initialize(
      @name : String,
      @parameter_version : Int64,
      @labels : Array(String)
    )
    end
  end
end
