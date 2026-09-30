private alias Core = Amazonite::Core

module Amazonite::Lambda
  # The size of the function's `/tmp` directory in MB. The default value is 512, but can be any
  # whole number between 512 and 10,240 MB. For more information, see [Configuring ephemeral storage
  # (console)](https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-ephemeral-storage).
  class EphemeralStorage
    include JSON::Serializable

    # The size of the function's `/tmp` directory.
    @[JSON::Field(key: "Size")]
    property size : Int32

    def initialize(
      @size : Int32,
    )
    end

    def validate! : Nil
      if value = @size
        raise Core::ValidationError.new("Size value must be >= 512") if value < 512
        raise Core::ValidationError.new("Size value must be <= 32768") if value > 32768
      end
    end

    def_equals_and_hash(@size)
  end
end
