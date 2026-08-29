module Amazonite::LambdaV1
  class SelfManagedEventSource
    include JSON::Serializable

    @[JSON::Field(key: "Endpoints")]
    property endpoints : Hash(EndPointType, Array(String)) | Nil

    def initialize(
      @endpoints : Hash(EndPointType, Array(String)) | Nil = nil,
    )
    end
  end
end
