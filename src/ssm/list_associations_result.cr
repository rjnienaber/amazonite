private alias Core = Amazonite::Core

module Amazonite::Ssm
  class ListAssociationsResult
    include JSON::Serializable

    # The associations.
    @[JSON::Field(key: "Associations")]
    property associations : Array(Association) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @associations : Array(Association) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@associations, @next_token)
  end
end
