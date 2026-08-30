private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class ListIntegrationsResponse
    include JSON::Serializable

    # An array, where each object in the array contains information about one CloudWatch Logs
    # integration in this account.
    @[JSON::Field(key: "integrationSummaries")]
    property integration_summaries : Array(IntegrationSummary) | Nil

    def initialize(
      @integration_summaries : Array(IntegrationSummary) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @integration_summaries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@integration_summaries)
  end
end
