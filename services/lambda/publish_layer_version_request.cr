private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @layer_name
        raise Core::ValidationError.new("LayerName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LayerName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("LayerName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 256") if value.size > 256
      end

      if value = @content
        value.validate!
      end

      if value = @compatible_architectures
        raise Core::ValidationError.new("CompatibleArchitectures must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("CompatibleArchitectures must have at most 2 item(s)") if value.size > 2
      end

      if value = @compatible_runtimes
        raise Core::ValidationError.new("CompatibleRuntimes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("CompatibleRuntimes must have at most 15 item(s)") if value.size > 15
      end

      if value = @license_info
        raise Core::ValidationError.new("LicenseInfo length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("LicenseInfo length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("LicenseInfo does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end
    end

    def_equals_and_hash(@layer_name, @description, @content, @compatible_architectures, @compatible_runtimes, @license_info)
  end
end
