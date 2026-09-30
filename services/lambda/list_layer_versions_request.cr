private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  class ListLayerVersionsRequest
    include JSON::Serializable

    # The compatible [instruction set
    # architecture](https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html).
    @[JSON::Field(key: "CompatibleArchitecture", converter: AL::Architecture, ignore: true)]
    property compatible_architecture : Architecture | Nil

    # A runtime identifier.
    #
    # The following list includes deprecated runtimes. For more information, see [Runtime use after
    # deprecation](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels).
    #
    # For a list of all currently supported runtimes, see [Supported
    # runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported).
    @[JSON::Field(key: "CompatibleRuntime", converter: AL::Runtime, ignore: true)]
    property compatible_runtime : Runtime | Nil

    # The name or Amazon Resource Name (ARN) of the layer.
    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    # A pagination token returned by a previous call.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # The maximum number of versions to return.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @layer_name : String,
      @compatible_architecture : Architecture | Nil = nil,
      @compatible_runtime : Runtime | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @layer_name
        raise Core::ValidationError.new("LayerName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LayerName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("LayerName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@compatible_architecture, @compatible_runtime, @layer_name, @marker, @max_items)
  end
end
