private alias Core = Amazonite::Core

module Amazonite::Lambda
  class DeleteLayerVersionRequest
    include JSON::Serializable

    # The name or Amazon Resource Name (ARN) of the layer.
    @[JSON::Field(key: "LayerName", ignore: true)]
    property layer_name : String = ""

    # The version number.
    @[JSON::Field(key: "VersionNumber", ignore: true)]
    property version_number : Int64 = 0

    def initialize(
      @layer_name : String,
      @version_number : Int64,
    )
    end

    def validate! : Nil
      if value = @layer_name
        raise Core::ValidationError.new("LayerName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LayerName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("LayerName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+$"))
      end
    end

    def_equals_and_hash(@layer_name, @version_number)
  end
end
