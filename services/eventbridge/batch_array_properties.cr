module Amazonite::EventBridge
  # The array properties for the submitted job, such as the size of the array. The array size can be
  # between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This
  # parameter is used only if the target is an Batch job.
  class BatchArrayProperties
    include JSON::Serializable

    # The size of the array, if this is an array batch job. Valid values are integers between 2 and
    # 10,000.
    @[JSON::Field(key: "Size")]
    property size : Int32 | Nil

    def initialize(
      @size : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@size)
  end
end
