private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Describes the primary or replica key in a multi-Region key.
  class MultiRegionKey
    include JSON::Serializable

    # Displays the key ARN of a primary or replica key of a multi-Region key.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # Displays the Amazon Web Services Region of a primary or replica key in a multi-Region key.
    @[JSON::Field(key: "Region")]
    property region : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @region : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end

      if value = @region
        raise Core::ValidationError.new("Region length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Region length must be <= 32") if value.size > 32
        raise Core::ValidationError.new("Region does not match the required pattern") unless value.matches?(Regex.new("^([a-z]+-){2,3}\\d+$"))
      end
    end

    def_equals_and_hash(@arn, @region)
  end
end
