private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  enum MinimumThroughputBillingCommitmentOutputStatus
    Enabled
    Disabled
    EnabledUntilEarliestAllowedEnd

    def self.to_json(e : MinimumThroughputBillingCommitmentOutputStatus, json : JSON::Builder) : Nil
      value = case e
              when AK::MinimumThroughputBillingCommitmentOutputStatus::Enabled                        then "ENABLED"
              when AK::MinimumThroughputBillingCommitmentOutputStatus::Disabled                       then "DISABLED"
              when AK::MinimumThroughputBillingCommitmentOutputStatus::EnabledUntilEarliestAllowedEnd then "ENABLED_UNTIL_EARLIEST_ALLOWED_END"
              else
                raise Exception.new("unknown enum value for 'MinimumThroughputBillingCommitmentOutputStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::MinimumThroughputBillingCommitmentOutputStatus
      value = pull.read_string
      case value
      when "ENABLED"                            then AK::MinimumThroughputBillingCommitmentOutputStatus::Enabled
      when "DISABLED"                           then AK::MinimumThroughputBillingCommitmentOutputStatus::Disabled
      when "ENABLED_UNTIL_EARLIEST_ALLOWED_END" then AK::MinimumThroughputBillingCommitmentOutputStatus::EnabledUntilEarliestAllowedEnd
      else
        raise Exception.new("unknown enum value for 'MinimumThroughputBillingCommitmentOutputStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::MinimumThroughputBillingCommitmentOutputStatus::Enabled                        then "ENABLED"
      when AK::MinimumThroughputBillingCommitmentOutputStatus::Disabled                       then "DISABLED"
      when AK::MinimumThroughputBillingCommitmentOutputStatus::EnabledUntilEarliestAllowedEnd then "ENABLED_UNTIL_EARLIEST_ALLOWED_END"
      else
        raise Exception.new("unknown enum value for 'MinimumThroughputBillingCommitmentOutputStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::MinimumThroughputBillingCommitmentOutputStatus?
      case key
      when "ENABLED"                            then AK::MinimumThroughputBillingCommitmentOutputStatus::Enabled
      when "DISABLED"                           then AK::MinimumThroughputBillingCommitmentOutputStatus::Disabled
      when "ENABLED_UNTIL_EARLIEST_ALLOWED_END" then AK::MinimumThroughputBillingCommitmentOutputStatus::EnabledUntilEarliestAllowedEnd
      else
        nil
      end
    end
  end
end
