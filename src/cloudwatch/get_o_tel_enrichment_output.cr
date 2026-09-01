private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  class GetOTelEnrichmentOutput
    include JSON::Serializable

    # The status of OTel enrichment for the account. Valid values are `Running` (enrichment is
    # enabled) and `Stopped` (enrichment is disabled).
    @[JSON::Field(key: "Status", converter: ACW::OTelEnrichmentStatus)]
    property status : OTelEnrichmentStatus

    def initialize(
      @status : OTelEnrichmentStatus,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
