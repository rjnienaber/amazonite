private alias Core = Amazonite::Core

module Amazonite::Lambda
  class GetLayerVersionByArnRequest
    include JSON::Serializable

    # The ARN of the layer version.
    @[JSON::Field(key: "Arn", ignore: true)]
    property arn : String = ""

    def initialize(
      @arn : String,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^((arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:layer:[a-zA-Z0-9-_]+:[0-9]+)|(arn:[a-zA-Z0-9-]+:lambda:::awslayer:[a-zA-Z0-9-_]+))$"))
      end
    end

    def_equals_and_hash(@arn)
  end
end
