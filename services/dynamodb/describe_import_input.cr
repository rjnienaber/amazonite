private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class DescribeImportInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the table you're importing to.
    @[JSON::Field(key: "ImportArn")]
    property import_arn : String

    def initialize(
      @import_arn : String,
    )
    end

    def validate! : Nil
      if value = @import_arn
        raise Core::ValidationError.new("ImportArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("ImportArn length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@import_arn)
  end
end
