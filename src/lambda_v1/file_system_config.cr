module Amazonite::LambdaV1
  class FileSystemConfig
    include JSON::Serializable

    @[JSON::Field(key: "Arn")]
    property arn : String

    @[JSON::Field(key: "LocalMountPath")]
    property local_mount_path : String

    def initialize(
      @arn : String,
      @local_mount_path : String,
    )
    end
  end
end
