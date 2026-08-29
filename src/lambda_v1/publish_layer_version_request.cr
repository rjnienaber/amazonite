private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class PublishLayerVersionRequest
    include JSON::Serializable

    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Content")]
    property content : LayerVersionContentInput

    @[JSON::Field(key: "CompatibleArchitectures", converter: Core::ArrayConverter(AL::Architecture))]
    property compatible_architectures : Array(Architecture) | Nil

    @[JSON::Field(key: "CompatibleRuntimes", converter: Core::ArrayConverter(AL::Runtime))]
    property compatible_runtimes : Array(Runtime) | Nil

    @[JSON::Field(key: "LicenseInfo")]
    property license_info : String | Nil

    def initialize(
      @layer_name : String,
      @content : LayerVersionContentInput,
      @description : String | Nil = nil,
      @compatible_architectures : Array(Architecture) | Nil = nil,
      @compatible_runtimes : Array(Runtime) | Nil = nil,
      @license_info : String | Nil = nil,
    )
    end
  end
end
