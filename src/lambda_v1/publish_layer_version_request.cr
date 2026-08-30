private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class PublishLayerVersionRequest
    include JSON::Serializable

    # The name or Amazon Resource Name (ARN) of the layer.
    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    # The description of the version.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The function layer archive.
    @[JSON::Field(key: "Content")]
    property content : LayerVersionContentInput

    # A list of compatible [instruction set
    # architectures](https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html).
    @[JSON::Field(key: "CompatibleArchitectures", converter: Core::ArrayConverter(AL::Architecture))]
    property compatible_architectures : Array(Architecture) | Nil

    # A list of compatible [function
    # runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html). Used for filtering
    # with ListLayers and ListLayerVersions.
    #
    # The following list includes deprecated runtimes. For more information, see [Runtime deprecation
    # policy](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-support-policy).
    @[JSON::Field(key: "CompatibleRuntimes", converter: Core::ArrayConverter(AL::Runtime))]
    property compatible_runtimes : Array(Runtime) | Nil

    # The layer's software license. It can be any of the following:
    #
    # - An [SPDX license identifier](https://spdx.org/licenses/). For example, `MIT`.
    #
    # - The URL of a license hosted on the internet. For example,
    # `https://opensource.org/licenses/MIT`.
    #
    # - The full text of the license.
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
