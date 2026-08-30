private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ListImportsOutput
    include JSON::Serializable

    # A list of `ImportSummary` objects.
    @[JSON::Field(key: "ImportSummaryList")]
    property import_summary_list : Array(ImportSummary) | Nil

    # If this value is returned, there are additional results to be displayed. To retrieve them, call
    # `ListImports` again, with `NextToken` set to this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @import_summary_list : Array(ImportSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @import_summary_list
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 112") if value.size < 112
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("NextToken does not match the required pattern") unless value.matches?(Regex.new("^([0-9a-f]{16})+$"))
      end
    end

    def_equals_and_hash(@import_summary_list, @next_token)
  end
end
