module Amazonite::SsmV1
  class ListAssociationsResult
    include JSON::Serializable

    @[JSON::Field(key: "Associations")]
    property associations : Array(Association) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @associations : Array(Association) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
