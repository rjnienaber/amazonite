module Amazonite::SsmV1
  class SessionManagerOutputUrl
    include JSON::Serializable

    @[JSON::Field(key: "S3OutputUrl")]
    property s3_output_url : String | Nil

    @[JSON::Field(key: "CloudWatchOutputUrl")]
    property cloud_watch_output_url : String | Nil

    def initialize(
      @s3_output_url : String | Nil = nil,
      @cloud_watch_output_url : String | Nil = nil
    )
    end
  end
end
