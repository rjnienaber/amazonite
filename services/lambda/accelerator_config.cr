module Amazonite::Lambda
  # The accelerator resource settings for a Lambda execution environment, including the amount of
  # accelerator memory to allocate.
  class AcceleratorConfig
    include JSON::Serializable

    # The minimum amount of memory (in GB) of each accelerator device exposed to the execution
    # environment. Lambda might allocate more, depending on the accelerator instance types available.
    @[JSON::Field(key: "AcceleratorMemorySize")]
    property accelerator_memory_size : Int32

    def initialize(
      @accelerator_memory_size : Int32,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@accelerator_memory_size)
  end
end
