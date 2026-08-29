module Amazonite::LambdaV1
  class GetAliasRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Name", ignore: true)]
    property name : String = ""

    def initialize(
      @function_name : String,
      @name : String,
    )
    end
  end
end
