module Amazonite::DynamoDBV2
  # Represents the input of a `DescribeLimits` operation. Has no content.
  class DescribeLimitsInput
    include JSON::Serializable

    def initialize
    end

    def_equals_and_hash()
  end
end
