module Amazonite::DynamoDBV2
  # Specifies the action to add a new witness Region to a MRSC global table. A MRSC global table can
  # be configured with either three replicas, or with two replicas and one witness.
  class CreateGlobalTableWitnessGroupMemberAction
    include JSON::Serializable

    # The Amazon Web Services Region name to be added as a witness Region for the MRSC global table.
    # The witness must be in a different Region than the replicas and within the same Region set:
    #
    # - US Region set: US East (N. Virginia), US East (Ohio), US West (Oregon)
    #
    # - EU Region set: Europe (Ireland), Europe (London), Europe (Paris), Europe (Frankfurt)
    #
    # - AP Region set: Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Osaka)
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    def initialize(
      @region_name : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@region_name)
  end
end
