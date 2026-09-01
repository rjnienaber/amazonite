module Amazonite::CloudWatch
  # A message returned by the `GetMetricData`API, including a code and a description.
  #
  # If a cross-Region `GetMetricData` operation fails with a code of `Forbidden` and a value of
  # `Authentication too complex to retrieve cross region data`, you can correct the problem by
  # running the `GetMetricData` operation in the same Region where the metric data is.
  class MessageData
    include JSON::Serializable

    # The error code or status code associated with the message.
    @[JSON::Field(key: "Code")]
    property code : String | Nil

    # The message text.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @code : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @value)
  end
end
