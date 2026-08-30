private alias AADS = Amazonite::ApplicationDiscoveryService
private alias Core = Amazonite::Core

module Amazonite::ApplicationDiscoveryService
  class Client < Core::Client
    Log = ::Log.for("amazonite.application_discovery_service.client")

    def initialize(config = Core::Config.new)
      super("AWSPoseidonService_V2015_11_01", "discovery", "1.1", nil, config)
    end

    # Deprecated. Use `StartExportTask` instead.
    #
    # Exports all discovered configuration data to an Amazon S3 bucket or an application that enables
    # you to view and evaluate the data. Data includes tags and tag associations, processes,
    # connections, servers, and system performance. This API returns an export ID that you can query
    # using the *DescribeExportConfigurations* API. The system imposes a limit of two configuration
    # exports in six hours.
    def export_configurations : Core::ParsedResponse(AADS::ExportConfigurationsResponse)
      Log.info { "performing 'ExportConfigurations' operation" }
      response = post("ExportConfigurations", "/", input.to_json)
      Core::ParsedResponse(AADS::ExportConfigurationsResponse).new(response)
    end
  end
end
