private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a version of an [Lambda
  # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  class LayerVersionsListItem
    include JSON::Serializable

    # The ARN of the layer version.
    @[JSON::Field(key: "LayerVersionArn")]
    property layer_version_arn : String | Nil

    # The version number.
    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

    # The description of the version.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The date that the version was created, in ISO 8601 format. For example,
    # `2018-11-27T15:10:45.123+0000`.
    @[JSON::Field(key: "CreatedDate")]
    property created_date : String | Nil

    # A list of compatible [instruction set
    # architectures](https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html).
    @[JSON::Field(key: "CompatibleArchitectures", converter: Core::ArrayConverter(AL::Architecture))]
    property compatible_architectures : Array(Architecture) | Nil

    # The layer's compatible runtimes.
    #
    # The following list includes deprecated runtimes. For more information, see [Runtime use after
    # deprecation](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels).
    #
    # For a list of all currently supported runtimes, see [Supported
    # runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported).
    @[JSON::Field(key: "CompatibleRuntimes", converter: Core::ArrayConverter(AL::Runtime))]
    property compatible_runtimes : Array(Runtime) | Nil

    # The layer's open-source license.
    @[JSON::Field(key: "LicenseInfo")]
    property license_info : String | Nil

    def initialize(
      @layer_version_arn : String | Nil = nil,
      @version : Int64 | Nil = nil,
      @description : String | Nil = nil,
      @created_date : String | Nil = nil,
      @compatible_architectures : Array(Architecture) | Nil = nil,
      @compatible_runtimes : Array(Runtime) | Nil = nil,
      @license_info : String | Nil = nil,
    )
    end

    def_equals_and_hash(@layer_version_arn, @version, @description, @created_date, @compatible_architectures, @compatible_runtimes, @license_info)
  end
end
