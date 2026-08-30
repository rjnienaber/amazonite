module Amazonite::CloudWatchLogsV1
  # A structure that contains information about one pattern token related to an anomaly.
  #
  # For more information about patterns and tokens, see
  # [CreateLogAnomalyDetector](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateLogAnomalyDetector.html).
  class PatternToken
    include JSON::Serializable

    # For a dynamic token, this indicates where in the pattern that this token appears, related to
    # other dynamic tokens. The dynamic token that appears first has a value of `1`, the one that
    # appears second is `2`, and so on.
    @[JSON::Field(key: "dynamicTokenPosition")]
    property dynamic_token_position : Int32 | Nil

    # Specifies whether this is a dynamic token.
    @[JSON::Field(key: "isDynamic")]
    property is_dynamic : Bool | Nil

    # The string represented by this token. If this is a dynamic token, the value will be ``
    @[JSON::Field(key: "tokenString")]
    property token_string : String | Nil

    # Contains the values found for a dynamic token, and the number of times each value was found.
    @[JSON::Field(key: "enumerations")]
    property enumerations : Hash(String, Int64) | Nil

    # A name that CloudWatch Logs assigned to this dynamic token to make the pattern more readable.
    # The string part of the `inferredTokenName` gives you a clearer idea of the content of this
    # token. The number part of the `inferredTokenName` shows where in the pattern this token appears,
    # compared to other dynamic tokens. CloudWatch Logs assigns the string part of the name based on
    # analyzing the content of the log events that contain it.
    #
    # For example, an inferred token name of `IPAddress-3` means that the token represents an IP
    # address, and this token is the third dynamic token in the pattern.
    @[JSON::Field(key: "inferredTokenName")]
    property inferred_token_name : String | Nil

    def initialize(
      @dynamic_token_position : Int32 | Nil = nil,
      @is_dynamic : Bool | Nil = nil,
      @token_string : String | Nil = nil,
      @enumerations : Hash(String, Int64) | Nil = nil,
      @inferred_token_name : String | Nil = nil,
    )
    end
  end
end
