private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class MetricDataResult
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    @[JSON::Field(key: "Label")]
    property label : String | Nil

    @[JSON::Field(key: "Timestamps")]
    property timestamps : Array(Time) | Nil

    @[JSON::Field(key: "Values")]
    property values : Array(Float64) | Nil

    @[JSON::Field(key: "StatusCode", converter: ACW::StatusCode)]
    property status_code : StatusCode | Nil

    @[JSON::Field(key: "Messages")]
    property messages : Array(MessageData) | Nil

    def initialize(
      @id : String | Nil = nil,
      @label : String | Nil = nil,
      @timestamps : Array(Time) | Nil = nil,
      @values : Array(Float64) | Nil = nil,
      @status_code : StatusCode | Nil = nil,
      @messages : Array(MessageData) | Nil = nil,
    )
    end
  end
end
