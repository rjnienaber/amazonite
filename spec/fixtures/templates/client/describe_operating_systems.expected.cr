module Amazonite::OpsWorks
  class Client < Amazonite::Core::Client
    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("OpsWorks_20130218", "opsworks", base_url, user_agent)
    end

    def describe_operating_systems() : Amazonite::Core::ParsedResponse(Amazonite::OpsWorks::DescribeOperatingSystemsResponse)
      response = post("DescribeOperatingSystems", "/", input.to_json)
      Amazonite::Core::ParsedResponse(Amazonite::OpsWorks::DescribeOperatingSystemsResponse).new(response)
    end
  end
end
