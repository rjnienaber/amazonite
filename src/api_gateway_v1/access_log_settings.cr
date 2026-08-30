module Amazonite::ApiGatewayV1
  # Access log settings, including the access log format and access log destination ARN.
  class AccessLogSettings
    include JSON::Serializable

    # A single line format of the access logs of data, as specified by selected $context variables.
    # The format must include at least `$context.requestId`.
    @[JSON::Field(key: "format")]
    property format : String | Nil

    # The Amazon Resource Name (ARN) of the CloudWatch Logs log group or Kinesis Data Firehose
    # delivery stream to receive access logs. If you specify a Kinesis Data Firehose delivery stream,
    # the stream name must begin with `amazon-apigateway-`.
    @[JSON::Field(key: "destinationArn")]
    property destination_arn : String | Nil

    def initialize(
      @format : String | Nil = nil,
      @destination_arn : String | Nil = nil,
    )
    end

    def_equals_and_hash(@format, @destination_arn)
  end
end
