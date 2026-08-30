private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class PublishLayerVersionResponse
    include JSON::Serializable

    # Details about the layer version.
    @[JSON::Field(key: "Content")]
    property content : LayerVersionContentOutput | Nil

    # The ARN of the layer.
    @[JSON::Field(key: "LayerArn")]
    property layer_arn : String | Nil

    # The ARN of the layer version.
    @[JSON::Field(key: "LayerVersionArn")]
    property layer_version_arn : String | Nil

    # The description of the version.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The date that the layer version was created, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "CreatedDate")]
    property created_date : String | Nil

    # The version number.
    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

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

    # The layer's software license.
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

    def validate! : Nil
      if value = @content
        value.validate!
      end

      if value = @layer_arn
        raise Core::ValidationError.new("LayerArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LayerArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("LayerArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+$"))
      end

      if value = @layer_version_arn
        raise Core::ValidationError.new("LayerVersionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LayerVersionArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("LayerVersionArn does not match the required pattern") unless value.matches?(Regex.new("^((arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+:[0-9]+)|(arn:[a-zA-Z0-9-]+:lambda:::awslayer:[a-zA-Z0-9-_]+))$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 256") if value.size > 256
      end

      if value = @created_date
        raise Core::ValidationError.new("CreatedDate length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("CreatedDate length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("CreatedDate does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
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

    def_equals_and_hash(@content, @layer_arn, @layer_version_arn, @description, @created_date, @version, @compatible_architectures, @compatible_runtimes, @license_info)
  end
end
