module Amazonite::LambdaV1
  # A structure within a `FilterCriteria` object that defines an event filtering pattern.
  class Filter
    include JSON::Serializable

    # A filter pattern. For more information on the syntax of a filter pattern, see [ Filter rule
    # syntax](https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-syntax).
    @[JSON::Field(key: "Pattern")]
    property pattern : String | Nil

    def initialize(
      @pattern : String | Nil = nil,
    )
    end

    def_equals_and_hash(@pattern)
  end
end
