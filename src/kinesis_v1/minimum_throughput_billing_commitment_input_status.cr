private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  enum MinimumThroughputBillingCommitmentInputStatus
    Enabled
    Disabled

    def self.to_json(e : MinimumThroughputBillingCommitmentInputStatus, json : JSON::Builder) : Nil
      value = case e
              when AK::MinimumThroughputBillingCommitmentInputStatus::Enabled  then "ENABLED"
              when AK::MinimumThroughputBillingCommitmentInputStatus::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'MinimumThroughputBillingCommitmentInputStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::MinimumThroughputBillingCommitmentInputStatus
      value = pull.read_string
      case value
      when "ENABLED"  then AK::MinimumThroughputBillingCommitmentInputStatus::Enabled
      when "DISABLED" then AK::MinimumThroughputBillingCommitmentInputStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'MinimumThroughputBillingCommitmentInputStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::MinimumThroughputBillingCommitmentInputStatus::Enabled  then "ENABLED"
      when AK::MinimumThroughputBillingCommitmentInputStatus::Disabled then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'MinimumThroughputBillingCommitmentInputStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::MinimumThroughputBillingCommitmentInputStatus?
      case key
      when "ENABLED"  then AK::MinimumThroughputBillingCommitmentInputStatus::Enabled
      when "DISABLED" then AK::MinimumThroughputBillingCommitmentInputStatus::Disabled
      else
        nil
      end
    end
  end
end
