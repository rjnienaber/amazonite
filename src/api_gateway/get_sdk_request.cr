module Amazonite::ApiGateway
  # Request a new generated client SDK for a RestApi and Stage.
  class GetSdkRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the Stage that the SDK will use.
    @[JSON::Field(key: "stageName", ignore: true)]
    property stage_name : String = ""

    # The language for the generated SDK. Currently `java`, `javascript`, `android`, `objectivec` (for
    # iOS), `swift` (for iOS), and `ruby` are supported.
    @[JSON::Field(key: "sdkType", ignore: true)]
    property sdk_type : String = ""

    # A string-to-string key-value map of query parameters `sdkType`-dependent properties of the SDK.
    # For `sdkType` of `objectivec` or `swift`, a parameter named `classPrefix` is required. For
    # `sdkType` of `android`, parameters named `groupId`, `artifactId`, `artifactVersion`, and
    # `invokerPackage` are required. For `sdkType` of `java`, parameters named `serviceName` and
    # `javaPackageName` are required.
    @[JSON::Field(key: "parameters")]
    property parameters : Hash(String, String) | Nil

    def initialize(
      @rest_api_id : String,
      @stage_name : String,
      @sdk_type : String,
      @parameters : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @stage_name, @sdk_type, @parameters)
  end
end
