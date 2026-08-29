module Amazonite::SnsV1
  class CreateSMSSandboxPhoneNumberResult
    def initialize
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end
  end
end
