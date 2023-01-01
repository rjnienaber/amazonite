module Amazonite::SsmV1
  class ParameterInlinePolicy
    include JSON::Serializable

    @[JSON::Field(key: "PolicyText")]
    property policy_text : String | Nil

    @[JSON::Field(key: "PolicyType")]
    property policy_type : String | Nil

    @[JSON::Field(key: "PolicyStatus")]
    property policy_status : String | Nil

    def initialize(
      @policy_text : String | Nil = nil,
      @policy_type : String | Nil = nil,
      @policy_status : String | Nil = nil
    )
    end
  end
end
