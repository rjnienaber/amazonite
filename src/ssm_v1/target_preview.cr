module Amazonite::SsmV1
  class TargetPreview
    include JSON::Serializable

    @[JSON::Field(key: "Count")]
    property count : Int32 | Nil

    @[JSON::Field(key: "TargetType")]
    property target_type : String | Nil

    def initialize(
      @count : Int32 | Nil = nil,
      @target_type : String | Nil = nil,
    )
    end
  end
end
