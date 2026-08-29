private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class GetLayerVersionResponse
    include JSON::Serializable

    @[JSON::Field(key: "Content")]
    property content : LayerVersionContentOutput | Nil

    @[JSON::Field(key: "LayerArn")]
    property layer_arn : String | Nil

    @[JSON::Field(key: "LayerVersionArn")]
    property layer_version_arn : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "CreatedDate")]
    property created_date : String | Nil

    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

    @[JSON::Field(key: "CompatibleArchitectures", converter: Core::ArrayConverter(AL::Architecture))]
    property compatible_architectures : Array(Architecture) | Nil

    @[JSON::Field(key: "CompatibleRuntimes", converter: Core::ArrayConverter(AL::Runtime))]
    property compatible_runtimes : Array(Runtime) | Nil

    @[JSON::Field(key: "LicenseInfo")]
    property license_info : String | Nil

    def initialize(
      @content : LayerVersionContentOutput | Nil = nil,
      @layer_arn : String | Nil = nil,
      @layer_version_arn : String | Nil = nil,
      @description : String | Nil = nil,
      @created_date : String | Nil = nil,
      @version : Int64 | Nil = nil,
      @compatible_architectures : Array(Architecture) | Nil = nil,
      @compatible_runtimes : Array(Runtime) | Nil = nil,
      @license_info : String | Nil = nil,
    )
    end
  end
end
