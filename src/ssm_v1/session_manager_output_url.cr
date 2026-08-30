module Amazonite::SsmV1
  # Reserved for future use.
  class SessionManagerOutputUrl
    include JSON::Serializable

    # Reserved for future use.
    @[JSON::Field(key: "S3OutputUrl")]
    property s3_output_url : String | Nil

    # Reserved for future use.
    @[JSON::Field(key: "CloudWatchOutputUrl")]
    property cloud_watch_output_url : String | Nil

    def initialize(
      @s3_output_url : String | Nil = nil,
      @cloud_watch_output_url : String | Nil = nil,
    )
    end

    def_equals_and_hash(@s3_output_url, @cloud_watch_output_url)
  end
end
