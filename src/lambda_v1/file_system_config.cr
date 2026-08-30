module Amazonite::LambdaV1
  # Details about the connection between a Lambda function and an [Amazon EFS file
  # system](https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html) or an
  # [Amazon S3 Files file
  # system](https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html).
  class FileSystemConfig
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Amazon EFS or Amazon S3 Files access point that provides
    # access to the file system.
    @[JSON::Field(key: "Arn")]
    property arn : String

    # The path where the function can access the file system, starting with `/mnt/`.
    @[JSON::Field(key: "LocalMountPath")]
    property local_mount_path : String

    def initialize(
      @arn : String,
      @local_mount_path : String,
    )
    end
  end
end
