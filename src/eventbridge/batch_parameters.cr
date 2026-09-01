private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # The custom parameters to be used when the target is an Batch job.
  class BatchParameters
    include JSON::Serializable

    # The ARN or name of the job definition to use if the event target is an Batch job. This job
    # definition must already exist.
    @[JSON::Field(key: "JobDefinition")]
    property job_definition : String

    # The name to use for this execution of the job, if the target is an Batch job.
    @[JSON::Field(key: "JobName")]
    property job_name : String

    # The array properties for the submitted job, such as the size of the array. The array size can be
    # between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This
    # parameter is used only if the target is an Batch job.
    @[JSON::Field(key: "ArrayProperties")]
    property array_properties : BatchArrayProperties | Nil

    # The retry strategy to use for failed jobs, if the target is an Batch job. The retry strategy is
    # the number of times to retry the failed job execution. Valid values are 1–10. When you specify a
    # retry strategy here, it overrides the retry strategy defined in the job definition.
    @[JSON::Field(key: "RetryStrategy")]
    property retry_strategy : BatchRetryStrategy | Nil

    def initialize(
      @job_definition : String,
      @job_name : String,
      @array_properties : BatchArrayProperties | Nil = nil,
      @retry_strategy : BatchRetryStrategy | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @array_properties
        value.validate!
      end

      if value = @retry_strategy
        value.validate!
      end
    end

    def_equals_and_hash(@job_definition, @job_name, @array_properties, @retry_strategy)
  end
end
