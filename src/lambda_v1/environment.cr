module Amazonite::LambdaV1
  # A function's environment variable settings. You can use environment variables to adjust your
  # function's behavior without updating code. An environment variable is a pair of strings that are
  # stored in a function's version-specific configuration.
  class Environment
    include JSON::Serializable

    # Environment variable key-value pairs. For more information, see [Using Lambda environment
    # variables](https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html).
    @[JSON::Field(key: "Variables")]
    property variables : Hash(String, String) | Nil

    def initialize(
      @variables : Hash(String, String) | Nil = nil,
    )
    end
  end
end
