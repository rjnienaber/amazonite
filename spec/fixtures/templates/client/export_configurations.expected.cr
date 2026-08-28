private alias AADS = Amazonite::ApplicationDiscoveryServiceV2
private alias Core = Amazonite::Core

module Amazonite::ApplicationDiscoveryServiceV2
  class Client < Core::Client
    Log = ::Log.for("amazonite.application_discovery_service_v2.client")

    def initialize(config = Core::Config.new)
      super("AWSPoseidonService_V2015_11_01", "discovery", "1.1", nil, config)
    end

    def export_configurations : Core::ParsedResponse(AADS::ExportConfigurationsResponse)
      Log.info { "performing 'ExportConfigurations' operation" }
      response = post("ExportConfigurations", "/", input.to_json)
      Core::ParsedResponse(AADS::ExportConfigurationsResponse).new(response)
    end
  end
end
