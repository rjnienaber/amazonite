private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Details about the connection between a Lambda function and an [Amazon EFS file
  # system](https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html) or an
  # [Amazon S3 file
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

    # The configuration for how your function accesses data on an Amazon S3 file system. Valid only
    # when the file system access point ARN is an Amazon S3 Files access point. If you specify a
    # different access point type (for example, Amazon Elastic File System), the operation returns an
    # `InvalidParameterException`.
    @[JSON::Field(key: "S3FilesConfig")]
    property s3_files_config : S3FilesConfig | Nil

    def initialize(
      @arn : String,
      @local_mount_path : String,
      @s3_files_config : S3FilesConfig | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Arn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-zA-Z-]*:elasticfilesystem:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:access-point/fsap-[a-f0-9]{17}$|^arn:aws[-a-z]*:s3files:[0-9a-z-:]+:file-system/fs-[0-9a-f]{17,40}/access-point/fsap-[0-9a-f]{17,40}$"))
      end

      if value = @local_mount_path
        raise Core::ValidationError.new("LocalMountPath length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("LocalMountPath length must be <= 160") if value.size > 160
        raise Core::ValidationError.new("LocalMountPath does not match the required pattern") unless value.matches?(Regex.new("^/mnt/[a-zA-Z0-9-_.]+$"))
      end

      if value = @s3_files_config
        value.validate!
      end
    end

    def_equals_and_hash(@arn, @local_mount_path, @s3_files_config)
  end
end
