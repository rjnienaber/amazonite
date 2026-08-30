private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Configuration values that override the container image Dockerfile settings. For more
  # information, see [Container image
  # settings](https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-parms).
  class ImageConfig
    include JSON::Serializable

    # Specifies the entry point to their application, which is typically the location of the runtime
    # executable.
    @[JSON::Field(key: "EntryPoint")]
    property entry_point : Array(String) | Nil

    # Specifies parameters that you want to pass in with ENTRYPOINT.
    @[JSON::Field(key: "Command")]
    property command : Array(String) | Nil

    # Specifies the working directory.
    @[JSON::Field(key: "WorkingDirectory")]
    property working_directory : String | Nil

    def initialize(
      @entry_point : Array(String) | Nil = nil,
      @command : Array(String) | Nil = nil,
      @working_directory : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @entry_point
        raise Core::ValidationError.new("EntryPoint must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("EntryPoint must have at most 1500 item(s)") if value.size > 1500
      end

      if value = @command
        raise Core::ValidationError.new("Command must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Command must have at most 1500 item(s)") if value.size > 1500
      end

      if value = @working_directory
        raise Core::ValidationError.new("WorkingDirectory length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("WorkingDirectory length must be <= 1000") if value.size > 1000
      end
    end

    def_equals_and_hash(@entry_point, @command, @working_directory)
  end
end
