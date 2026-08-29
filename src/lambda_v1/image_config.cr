module Amazonite::LambdaV1
  class ImageConfig
    include JSON::Serializable

    @[JSON::Field(key: "EntryPoint")]
    property entry_point : Array(String) | Nil

    @[JSON::Field(key: "Command")]
    property command : Array(String) | Nil

    @[JSON::Field(key: "WorkingDirectory")]
    property working_directory : String | Nil

    def initialize(
      @entry_point : Array(String) | Nil = nil,
      @command : Array(String) | Nil = nil,
      @working_directory : String | Nil = nil,
    )
    end
  end
end
