private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Metric
    ReservationTotalCapacityHrsVcpu
    ReservationTotalCapacityHrsInst
    ReservationMaxSizeVcpu
    ReservationMaxSizeInst
    ReservationMinSizeVcpu
    ReservationMinSizeInst
    ReservationUnusedTotalCapacityHrsVcpu
    ReservationUnusedTotalCapacityHrsInst
    ReservationUnusedTotalEstimatedCost
    ReservationMaxUnusedSizeVcpu
    ReservationMaxUnusedSizeInst
    ReservationMinUnusedSizeVcpu
    ReservationMinUnusedSizeInst
    ReservationMaxUtilization
    ReservationMinUtilization
    ReservationAvgUtilizationVcpu
    ReservationAvgUtilizationInst
    ReservationTotalCount
    ReservationTotalEstimatedCost
    ReservationAvgFutureSizeVcpu
    ReservationAvgFutureSizeInst
    ReservationMinFutureSizeVcpu
    ReservationMinFutureSizeInst
    ReservationMaxFutureSizeVcpu
    ReservationMaxFutureSizeInst
    ReservationAvgCommittedSizeVcpu
    ReservationAvgCommittedSizeInst
    ReservationMaxCommittedSizeVcpu
    ReservationMaxCommittedSizeInst
    ReservationMinCommittedSizeVcpu
    ReservationMinCommittedSizeInst
    ReservedTotalUsageHrsVcpu
    ReservedTotalUsageHrsInst
    ReservedTotalEstimatedCost
    UnreservedTotalUsageHrsVcpu
    UnreservedTotalUsageHrsInst
    UnreservedTotalEstimatedCost
    SpotTotalUsageHrsVcpu
    SpotTotalUsageHrsInst
    SpotTotalEstimatedCost
    SpotAvgRunTimeBeforeInterruptionInst
    SpotMaxRunTimeBeforeInterruptionInst
    SpotMinRunTimeBeforeInterruptionInst
    SpotTotalInterruptionsInst
    SpotTotalInterruptionsVcpu
    SpotTotalCountInst
    SpotTotalCountVcpu
    SpotInterruptionRateInst
    SpotInterruptionRateVcpu

    def self.to_json(e : Metric, json : JSON::Builder) : Nil
      value = case e
              when AEC::Metric::ReservationTotalCapacityHrsVcpu       then "reservation-total-capacity-hrs-vcpu"
              when AEC::Metric::ReservationTotalCapacityHrsInst       then "reservation-total-capacity-hrs-inst"
              when AEC::Metric::ReservationMaxSizeVcpu                then "reservation-max-size-vcpu"
              when AEC::Metric::ReservationMaxSizeInst                then "reservation-max-size-inst"
              when AEC::Metric::ReservationMinSizeVcpu                then "reservation-min-size-vcpu"
              when AEC::Metric::ReservationMinSizeInst                then "reservation-min-size-inst"
              when AEC::Metric::ReservationUnusedTotalCapacityHrsVcpu then "reservation-unused-total-capacity-hrs-vcpu"
              when AEC::Metric::ReservationUnusedTotalCapacityHrsInst then "reservation-unused-total-capacity-hrs-inst"
              when AEC::Metric::ReservationUnusedTotalEstimatedCost   then "reservation-unused-total-estimated-cost"
              when AEC::Metric::ReservationMaxUnusedSizeVcpu          then "reservation-max-unused-size-vcpu"
              when AEC::Metric::ReservationMaxUnusedSizeInst          then "reservation-max-unused-size-inst"
              when AEC::Metric::ReservationMinUnusedSizeVcpu          then "reservation-min-unused-size-vcpu"
              when AEC::Metric::ReservationMinUnusedSizeInst          then "reservation-min-unused-size-inst"
              when AEC::Metric::ReservationMaxUtilization             then "reservation-max-utilization"
              when AEC::Metric::ReservationMinUtilization             then "reservation-min-utilization"
              when AEC::Metric::ReservationAvgUtilizationVcpu         then "reservation-avg-utilization-vcpu"
              when AEC::Metric::ReservationAvgUtilizationInst         then "reservation-avg-utilization-inst"
              when AEC::Metric::ReservationTotalCount                 then "reservation-total-count"
              when AEC::Metric::ReservationTotalEstimatedCost         then "reservation-total-estimated-cost"
              when AEC::Metric::ReservationAvgFutureSizeVcpu          then "reservation-avg-future-size-vcpu"
              when AEC::Metric::ReservationAvgFutureSizeInst          then "reservation-avg-future-size-inst"
              when AEC::Metric::ReservationMinFutureSizeVcpu          then "reservation-min-future-size-vcpu"
              when AEC::Metric::ReservationMinFutureSizeInst          then "reservation-min-future-size-inst"
              when AEC::Metric::ReservationMaxFutureSizeVcpu          then "reservation-max-future-size-vcpu"
              when AEC::Metric::ReservationMaxFutureSizeInst          then "reservation-max-future-size-inst"
              when AEC::Metric::ReservationAvgCommittedSizeVcpu       then "reservation-avg-committed-size-vcpu"
              when AEC::Metric::ReservationAvgCommittedSizeInst       then "reservation-avg-committed-size-inst"
              when AEC::Metric::ReservationMaxCommittedSizeVcpu       then "reservation-max-committed-size-vcpu"
              when AEC::Metric::ReservationMaxCommittedSizeInst       then "reservation-max-committed-size-inst"
              when AEC::Metric::ReservationMinCommittedSizeVcpu       then "reservation-min-committed-size-vcpu"
              when AEC::Metric::ReservationMinCommittedSizeInst       then "reservation-min-committed-size-inst"
              when AEC::Metric::ReservedTotalUsageHrsVcpu             then "reserved-total-usage-hrs-vcpu"
              when AEC::Metric::ReservedTotalUsageHrsInst             then "reserved-total-usage-hrs-inst"
              when AEC::Metric::ReservedTotalEstimatedCost            then "reserved-total-estimated-cost"
              when AEC::Metric::UnreservedTotalUsageHrsVcpu           then "unreserved-total-usage-hrs-vcpu"
              when AEC::Metric::UnreservedTotalUsageHrsInst           then "unreserved-total-usage-hrs-inst"
              when AEC::Metric::UnreservedTotalEstimatedCost          then "unreserved-total-estimated-cost"
              when AEC::Metric::SpotTotalUsageHrsVcpu                 then "spot-total-usage-hrs-vcpu"
              when AEC::Metric::SpotTotalUsageHrsInst                 then "spot-total-usage-hrs-inst"
              when AEC::Metric::SpotTotalEstimatedCost                then "spot-total-estimated-cost"
              when AEC::Metric::SpotAvgRunTimeBeforeInterruptionInst  then "spot-avg-run-time-before-interruption-inst"
              when AEC::Metric::SpotMaxRunTimeBeforeInterruptionInst  then "spot-max-run-time-before-interruption-inst"
              when AEC::Metric::SpotMinRunTimeBeforeInterruptionInst  then "spot-min-run-time-before-interruption-inst"
              when AEC::Metric::SpotTotalInterruptionsInst            then "spot-total-interruptions-inst"
              when AEC::Metric::SpotTotalInterruptionsVcpu            then "spot-total-interruptions-vcpu"
              when AEC::Metric::SpotTotalCountInst                    then "spot-total-count-inst"
              when AEC::Metric::SpotTotalCountVcpu                    then "spot-total-count-vcpu"
              when AEC::Metric::SpotInterruptionRateInst              then "spot-interruption-rate-inst"
              when AEC::Metric::SpotInterruptionRateVcpu              then "spot-interruption-rate-vcpu"
              else
                raise Exception.new("unknown enum value for 'Metric' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Metric
      value = pull.read_string
      case value
      when "reservation-total-capacity-hrs-vcpu"        then AEC::Metric::ReservationTotalCapacityHrsVcpu
      when "reservation-total-capacity-hrs-inst"        then AEC::Metric::ReservationTotalCapacityHrsInst
      when "reservation-max-size-vcpu"                  then AEC::Metric::ReservationMaxSizeVcpu
      when "reservation-max-size-inst"                  then AEC::Metric::ReservationMaxSizeInst
      when "reservation-min-size-vcpu"                  then AEC::Metric::ReservationMinSizeVcpu
      when "reservation-min-size-inst"                  then AEC::Metric::ReservationMinSizeInst
      when "reservation-unused-total-capacity-hrs-vcpu" then AEC::Metric::ReservationUnusedTotalCapacityHrsVcpu
      when "reservation-unused-total-capacity-hrs-inst" then AEC::Metric::ReservationUnusedTotalCapacityHrsInst
      when "reservation-unused-total-estimated-cost"    then AEC::Metric::ReservationUnusedTotalEstimatedCost
      when "reservation-max-unused-size-vcpu"           then AEC::Metric::ReservationMaxUnusedSizeVcpu
      when "reservation-max-unused-size-inst"           then AEC::Metric::ReservationMaxUnusedSizeInst
      when "reservation-min-unused-size-vcpu"           then AEC::Metric::ReservationMinUnusedSizeVcpu
      when "reservation-min-unused-size-inst"           then AEC::Metric::ReservationMinUnusedSizeInst
      when "reservation-max-utilization"                then AEC::Metric::ReservationMaxUtilization
      when "reservation-min-utilization"                then AEC::Metric::ReservationMinUtilization
      when "reservation-avg-utilization-vcpu"           then AEC::Metric::ReservationAvgUtilizationVcpu
      when "reservation-avg-utilization-inst"           then AEC::Metric::ReservationAvgUtilizationInst
      when "reservation-total-count"                    then AEC::Metric::ReservationTotalCount
      when "reservation-total-estimated-cost"           then AEC::Metric::ReservationTotalEstimatedCost
      when "reservation-avg-future-size-vcpu"           then AEC::Metric::ReservationAvgFutureSizeVcpu
      when "reservation-avg-future-size-inst"           then AEC::Metric::ReservationAvgFutureSizeInst
      when "reservation-min-future-size-vcpu"           then AEC::Metric::ReservationMinFutureSizeVcpu
      when "reservation-min-future-size-inst"           then AEC::Metric::ReservationMinFutureSizeInst
      when "reservation-max-future-size-vcpu"           then AEC::Metric::ReservationMaxFutureSizeVcpu
      when "reservation-max-future-size-inst"           then AEC::Metric::ReservationMaxFutureSizeInst
      when "reservation-avg-committed-size-vcpu"        then AEC::Metric::ReservationAvgCommittedSizeVcpu
      when "reservation-avg-committed-size-inst"        then AEC::Metric::ReservationAvgCommittedSizeInst
      when "reservation-max-committed-size-vcpu"        then AEC::Metric::ReservationMaxCommittedSizeVcpu
      when "reservation-max-committed-size-inst"        then AEC::Metric::ReservationMaxCommittedSizeInst
      when "reservation-min-committed-size-vcpu"        then AEC::Metric::ReservationMinCommittedSizeVcpu
      when "reservation-min-committed-size-inst"        then AEC::Metric::ReservationMinCommittedSizeInst
      when "reserved-total-usage-hrs-vcpu"              then AEC::Metric::ReservedTotalUsageHrsVcpu
      when "reserved-total-usage-hrs-inst"              then AEC::Metric::ReservedTotalUsageHrsInst
      when "reserved-total-estimated-cost"              then AEC::Metric::ReservedTotalEstimatedCost
      when "unreserved-total-usage-hrs-vcpu"            then AEC::Metric::UnreservedTotalUsageHrsVcpu
      when "unreserved-total-usage-hrs-inst"            then AEC::Metric::UnreservedTotalUsageHrsInst
      when "unreserved-total-estimated-cost"            then AEC::Metric::UnreservedTotalEstimatedCost
      when "spot-total-usage-hrs-vcpu"                  then AEC::Metric::SpotTotalUsageHrsVcpu
      when "spot-total-usage-hrs-inst"                  then AEC::Metric::SpotTotalUsageHrsInst
      when "spot-total-estimated-cost"                  then AEC::Metric::SpotTotalEstimatedCost
      when "spot-avg-run-time-before-interruption-inst" then AEC::Metric::SpotAvgRunTimeBeforeInterruptionInst
      when "spot-max-run-time-before-interruption-inst" then AEC::Metric::SpotMaxRunTimeBeforeInterruptionInst
      when "spot-min-run-time-before-interruption-inst" then AEC::Metric::SpotMinRunTimeBeforeInterruptionInst
      when "spot-total-interruptions-inst"              then AEC::Metric::SpotTotalInterruptionsInst
      when "spot-total-interruptions-vcpu"              then AEC::Metric::SpotTotalInterruptionsVcpu
      when "spot-total-count-inst"                      then AEC::Metric::SpotTotalCountInst
      when "spot-total-count-vcpu"                      then AEC::Metric::SpotTotalCountVcpu
      when "spot-interruption-rate-inst"                then AEC::Metric::SpotInterruptionRateInst
      when "spot-interruption-rate-vcpu"                then AEC::Metric::SpotInterruptionRateVcpu
      else
        raise Exception.new("unknown enum value for 'Metric' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Metric::ReservationTotalCapacityHrsVcpu       then "reservation-total-capacity-hrs-vcpu"
      when AEC::Metric::ReservationTotalCapacityHrsInst       then "reservation-total-capacity-hrs-inst"
      when AEC::Metric::ReservationMaxSizeVcpu                then "reservation-max-size-vcpu"
      when AEC::Metric::ReservationMaxSizeInst                then "reservation-max-size-inst"
      when AEC::Metric::ReservationMinSizeVcpu                then "reservation-min-size-vcpu"
      when AEC::Metric::ReservationMinSizeInst                then "reservation-min-size-inst"
      when AEC::Metric::ReservationUnusedTotalCapacityHrsVcpu then "reservation-unused-total-capacity-hrs-vcpu"
      when AEC::Metric::ReservationUnusedTotalCapacityHrsInst then "reservation-unused-total-capacity-hrs-inst"
      when AEC::Metric::ReservationUnusedTotalEstimatedCost   then "reservation-unused-total-estimated-cost"
      when AEC::Metric::ReservationMaxUnusedSizeVcpu          then "reservation-max-unused-size-vcpu"
      when AEC::Metric::ReservationMaxUnusedSizeInst          then "reservation-max-unused-size-inst"
      when AEC::Metric::ReservationMinUnusedSizeVcpu          then "reservation-min-unused-size-vcpu"
      when AEC::Metric::ReservationMinUnusedSizeInst          then "reservation-min-unused-size-inst"
      when AEC::Metric::ReservationMaxUtilization             then "reservation-max-utilization"
      when AEC::Metric::ReservationMinUtilization             then "reservation-min-utilization"
      when AEC::Metric::ReservationAvgUtilizationVcpu         then "reservation-avg-utilization-vcpu"
      when AEC::Metric::ReservationAvgUtilizationInst         then "reservation-avg-utilization-inst"
      when AEC::Metric::ReservationTotalCount                 then "reservation-total-count"
      when AEC::Metric::ReservationTotalEstimatedCost         then "reservation-total-estimated-cost"
      when AEC::Metric::ReservationAvgFutureSizeVcpu          then "reservation-avg-future-size-vcpu"
      when AEC::Metric::ReservationAvgFutureSizeInst          then "reservation-avg-future-size-inst"
      when AEC::Metric::ReservationMinFutureSizeVcpu          then "reservation-min-future-size-vcpu"
      when AEC::Metric::ReservationMinFutureSizeInst          then "reservation-min-future-size-inst"
      when AEC::Metric::ReservationMaxFutureSizeVcpu          then "reservation-max-future-size-vcpu"
      when AEC::Metric::ReservationMaxFutureSizeInst          then "reservation-max-future-size-inst"
      when AEC::Metric::ReservationAvgCommittedSizeVcpu       then "reservation-avg-committed-size-vcpu"
      when AEC::Metric::ReservationAvgCommittedSizeInst       then "reservation-avg-committed-size-inst"
      when AEC::Metric::ReservationMaxCommittedSizeVcpu       then "reservation-max-committed-size-vcpu"
      when AEC::Metric::ReservationMaxCommittedSizeInst       then "reservation-max-committed-size-inst"
      when AEC::Metric::ReservationMinCommittedSizeVcpu       then "reservation-min-committed-size-vcpu"
      when AEC::Metric::ReservationMinCommittedSizeInst       then "reservation-min-committed-size-inst"
      when AEC::Metric::ReservedTotalUsageHrsVcpu             then "reserved-total-usage-hrs-vcpu"
      when AEC::Metric::ReservedTotalUsageHrsInst             then "reserved-total-usage-hrs-inst"
      when AEC::Metric::ReservedTotalEstimatedCost            then "reserved-total-estimated-cost"
      when AEC::Metric::UnreservedTotalUsageHrsVcpu           then "unreserved-total-usage-hrs-vcpu"
      when AEC::Metric::UnreservedTotalUsageHrsInst           then "unreserved-total-usage-hrs-inst"
      when AEC::Metric::UnreservedTotalEstimatedCost          then "unreserved-total-estimated-cost"
      when AEC::Metric::SpotTotalUsageHrsVcpu                 then "spot-total-usage-hrs-vcpu"
      when AEC::Metric::SpotTotalUsageHrsInst                 then "spot-total-usage-hrs-inst"
      when AEC::Metric::SpotTotalEstimatedCost                then "spot-total-estimated-cost"
      when AEC::Metric::SpotAvgRunTimeBeforeInterruptionInst  then "spot-avg-run-time-before-interruption-inst"
      when AEC::Metric::SpotMaxRunTimeBeforeInterruptionInst  then "spot-max-run-time-before-interruption-inst"
      when AEC::Metric::SpotMinRunTimeBeforeInterruptionInst  then "spot-min-run-time-before-interruption-inst"
      when AEC::Metric::SpotTotalInterruptionsInst            then "spot-total-interruptions-inst"
      when AEC::Metric::SpotTotalInterruptionsVcpu            then "spot-total-interruptions-vcpu"
      when AEC::Metric::SpotTotalCountInst                    then "spot-total-count-inst"
      when AEC::Metric::SpotTotalCountVcpu                    then "spot-total-count-vcpu"
      when AEC::Metric::SpotInterruptionRateInst              then "spot-interruption-rate-inst"
      when AEC::Metric::SpotInterruptionRateVcpu              then "spot-interruption-rate-vcpu"
      else
        raise Exception.new("unknown enum value for 'Metric' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Metric?
      case key
      when "reservation-total-capacity-hrs-vcpu"        then AEC::Metric::ReservationTotalCapacityHrsVcpu
      when "reservation-total-capacity-hrs-inst"        then AEC::Metric::ReservationTotalCapacityHrsInst
      when "reservation-max-size-vcpu"                  then AEC::Metric::ReservationMaxSizeVcpu
      when "reservation-max-size-inst"                  then AEC::Metric::ReservationMaxSizeInst
      when "reservation-min-size-vcpu"                  then AEC::Metric::ReservationMinSizeVcpu
      when "reservation-min-size-inst"                  then AEC::Metric::ReservationMinSizeInst
      when "reservation-unused-total-capacity-hrs-vcpu" then AEC::Metric::ReservationUnusedTotalCapacityHrsVcpu
      when "reservation-unused-total-capacity-hrs-inst" then AEC::Metric::ReservationUnusedTotalCapacityHrsInst
      when "reservation-unused-total-estimated-cost"    then AEC::Metric::ReservationUnusedTotalEstimatedCost
      when "reservation-max-unused-size-vcpu"           then AEC::Metric::ReservationMaxUnusedSizeVcpu
      when "reservation-max-unused-size-inst"           then AEC::Metric::ReservationMaxUnusedSizeInst
      when "reservation-min-unused-size-vcpu"           then AEC::Metric::ReservationMinUnusedSizeVcpu
      when "reservation-min-unused-size-inst"           then AEC::Metric::ReservationMinUnusedSizeInst
      when "reservation-max-utilization"                then AEC::Metric::ReservationMaxUtilization
      when "reservation-min-utilization"                then AEC::Metric::ReservationMinUtilization
      when "reservation-avg-utilization-vcpu"           then AEC::Metric::ReservationAvgUtilizationVcpu
      when "reservation-avg-utilization-inst"           then AEC::Metric::ReservationAvgUtilizationInst
      when "reservation-total-count"                    then AEC::Metric::ReservationTotalCount
      when "reservation-total-estimated-cost"           then AEC::Metric::ReservationTotalEstimatedCost
      when "reservation-avg-future-size-vcpu"           then AEC::Metric::ReservationAvgFutureSizeVcpu
      when "reservation-avg-future-size-inst"           then AEC::Metric::ReservationAvgFutureSizeInst
      when "reservation-min-future-size-vcpu"           then AEC::Metric::ReservationMinFutureSizeVcpu
      when "reservation-min-future-size-inst"           then AEC::Metric::ReservationMinFutureSizeInst
      when "reservation-max-future-size-vcpu"           then AEC::Metric::ReservationMaxFutureSizeVcpu
      when "reservation-max-future-size-inst"           then AEC::Metric::ReservationMaxFutureSizeInst
      when "reservation-avg-committed-size-vcpu"        then AEC::Metric::ReservationAvgCommittedSizeVcpu
      when "reservation-avg-committed-size-inst"        then AEC::Metric::ReservationAvgCommittedSizeInst
      when "reservation-max-committed-size-vcpu"        then AEC::Metric::ReservationMaxCommittedSizeVcpu
      when "reservation-max-committed-size-inst"        then AEC::Metric::ReservationMaxCommittedSizeInst
      when "reservation-min-committed-size-vcpu"        then AEC::Metric::ReservationMinCommittedSizeVcpu
      when "reservation-min-committed-size-inst"        then AEC::Metric::ReservationMinCommittedSizeInst
      when "reserved-total-usage-hrs-vcpu"              then AEC::Metric::ReservedTotalUsageHrsVcpu
      when "reserved-total-usage-hrs-inst"              then AEC::Metric::ReservedTotalUsageHrsInst
      when "reserved-total-estimated-cost"              then AEC::Metric::ReservedTotalEstimatedCost
      when "unreserved-total-usage-hrs-vcpu"            then AEC::Metric::UnreservedTotalUsageHrsVcpu
      when "unreserved-total-usage-hrs-inst"            then AEC::Metric::UnreservedTotalUsageHrsInst
      when "unreserved-total-estimated-cost"            then AEC::Metric::UnreservedTotalEstimatedCost
      when "spot-total-usage-hrs-vcpu"                  then AEC::Metric::SpotTotalUsageHrsVcpu
      when "spot-total-usage-hrs-inst"                  then AEC::Metric::SpotTotalUsageHrsInst
      when "spot-total-estimated-cost"                  then AEC::Metric::SpotTotalEstimatedCost
      when "spot-avg-run-time-before-interruption-inst" then AEC::Metric::SpotAvgRunTimeBeforeInterruptionInst
      when "spot-max-run-time-before-interruption-inst" then AEC::Metric::SpotMaxRunTimeBeforeInterruptionInst
      when "spot-min-run-time-before-interruption-inst" then AEC::Metric::SpotMinRunTimeBeforeInterruptionInst
      when "spot-total-interruptions-inst"              then AEC::Metric::SpotTotalInterruptionsInst
      when "spot-total-interruptions-vcpu"              then AEC::Metric::SpotTotalInterruptionsVcpu
      when "spot-total-count-inst"                      then AEC::Metric::SpotTotalCountInst
      when "spot-total-count-vcpu"                      then AEC::Metric::SpotTotalCountVcpu
      when "spot-interruption-rate-inst"                then AEC::Metric::SpotInterruptionRateInst
      when "spot-interruption-rate-vcpu"                then AEC::Metric::SpotInterruptionRateVcpu
      else
        nil
      end
    end
  end
end
