module Amazonite::LambdaV1
  class GetLayerVersionByArnRequest
    include JSON::Serializable

    # The ARN of the layer version.
    @[JSON::Field(key: "Arn", ignore: true)]
    property arn : String = ""

    def initialize(
      @arn : String,
    )
    end
  end
end
