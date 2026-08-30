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
  end
end
