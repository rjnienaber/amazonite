private alias AOW = Amazonite::OpsWorksv2
private alias AC = Amazonite::Core

module Amazonite::OpsWorksv2
  class Client < AC::Client
    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("OpsWorks_20130218", "opsworks", nil, base_url, user_agent)
    end

    def describe_operating_systems : AC::ParsedResponse(AOW::DescribeOperatingSystemsResponse)
      response = post("DescribeOperatingSystems", "/", input.to_json)
      AC::ParsedResponse(AOW::DescribeOperatingSystemsResponse).new(response)
    end
  end
end
