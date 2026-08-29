module Amazonite::LambdaV1
  class GetLayerVersionByArnRequest
    include JSON::Serializable

    @[JSON::Field(key: "Arn", ignore: true)]
    property arn : String = ""

    def initialize(
      @arn : String,
    )
    end
  end
end
