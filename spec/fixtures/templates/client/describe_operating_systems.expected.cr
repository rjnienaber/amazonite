private alias AOW = Amazonite::OpsWorksV2
private alias Core = Amazonite::Core

module Amazonite::OpsWorksV2
  class Client < Core::Client
    Log = ::Log.for("amazonite.opsworks_v2.client")

    def initialize(config = Core::Config.new)
      super("OpsWorks_20130218", "opsworks", nil, config)
    end

    def describe_operating_systems : Core::ParsedResponse(AOW::DescribeOperatingSystemsResponse)
      Log.info { "performing 'DescribeOperatingSystems' operation" }
      response = post("DescribeOperatingSystems", "/", input.to_json)
      Core::ParsedResponse(AOW::DescribeOperatingSystemsResponse).new(response)
    end
  end
end
