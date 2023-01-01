module Amazonite::SsmV1
  class ListCommandsRequest
    include JSON::Serializable

    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(CommandFilter) | Nil

    def initialize(
      @command_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(CommandFilter) | Nil = nil
    )
    end
  end
end
