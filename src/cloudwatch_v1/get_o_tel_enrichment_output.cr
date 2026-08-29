private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class GetOTelEnrichmentOutput
    include JSON::Serializable

    @[JSON::Field(key: "Status", converter: ACW::OTelEnrichmentStatus)]
    property status : OTelEnrichmentStatus

    def initialize(
      @status : OTelEnrichmentStatus,
    )
    end
  end
end
