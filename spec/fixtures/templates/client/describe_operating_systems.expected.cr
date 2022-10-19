private alias AOW = Amazonite::OpsWorksv2
private alias AC = Amazonite::Core

module Amazonite::OpsWorksv2
  class Client < AC::Client
    Log = ::Log.for("amazonite.opsworks_v2.client")

    def initialize(config = AC::Config.new)
      super("OpsWorks_20130218", "opsworks", nil, config)
    end

    def describe_operating_systems : AC::ParsedResponse(AOW::DescribeOperatingSystemsResponse)
      Log.info { "performing 'DescribeOperatingSystems' operation" }
      response = post("DescribeOperatingSystems", "/", input.to_json)
      AC::ParsedResponse(AOW::DescribeOperatingSystemsResponse).new(response)
    end
  end
end
