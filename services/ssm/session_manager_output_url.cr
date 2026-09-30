private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @s3_output_url
        raise Core::ValidationError.new("S3OutputUrl length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("S3OutputUrl length must be <= 2083") if value.size > 2083
      end

      if value = @cloud_watch_output_url
        raise Core::ValidationError.new("CloudWatchOutputUrl length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CloudWatchOutputUrl length must be <= 2083") if value.size > 2083
      end
    end

    def_equals_and_hash(@s3_output_url, @cloud_watch_output_url)
  end
end
