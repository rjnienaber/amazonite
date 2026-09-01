private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  class ListLayersRequest
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

    # A pagination token returned by a previous call.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # The maximum number of layers to return.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @compatible_architecture : Architecture | Nil = nil,
      @compatible_runtime : Runtime | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@compatible_architecture, @compatible_runtime, @marker, @max_items)
  end
end
