private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ByoipCidrState
    Advertised
    Deprovisioned
    FailedDeprovision
    FailedProvision
    PendingAdvertising
    PendingDeprovision
    PendingProvision
    PendingWithdrawal
    Provisioned
    ProvisionedNotPubliclyAdvertisable

    def self.to_json(e : ByoipCidrState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ByoipCidrState::Advertised                         then "advertised"
              when AEC::ByoipCidrState::Deprovisioned                      then "deprovisioned"
              when AEC::ByoipCidrState::FailedDeprovision                  then "failed-deprovision"
              when AEC::ByoipCidrState::FailedProvision                    then "failed-provision"
              when AEC::ByoipCidrState::PendingAdvertising                 then "pending-advertising"
              when AEC::ByoipCidrState::PendingDeprovision                 then "pending-deprovision"
              when AEC::ByoipCidrState::PendingProvision                   then "pending-provision"
              when AEC::ByoipCidrState::PendingWithdrawal                  then "pending-withdrawal"
              when AEC::ByoipCidrState::Provisioned                        then "provisioned"
              when AEC::ByoipCidrState::ProvisionedNotPubliclyAdvertisable then "provisioned-not-publicly-advertisable"
              else
                raise Exception.new("unknown enum value for 'ByoipCidrState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ByoipCidrState
      value = pull.read_string
      case value
      when "advertised"                            then AEC::ByoipCidrState::Advertised
      when "deprovisioned"                         then AEC::ByoipCidrState::Deprovisioned
      when "failed-deprovision"                    then AEC::ByoipCidrState::FailedDeprovision
      when "failed-provision"                      then AEC::ByoipCidrState::FailedProvision
      when "pending-advertising"                   then AEC::ByoipCidrState::PendingAdvertising
      when "pending-deprovision"                   then AEC::ByoipCidrState::PendingDeprovision
      when "pending-provision"                     then AEC::ByoipCidrState::PendingProvision
      when "pending-withdrawal"                    then AEC::ByoipCidrState::PendingWithdrawal
      when "provisioned"                           then AEC::ByoipCidrState::Provisioned
      when "provisioned-not-publicly-advertisable" then AEC::ByoipCidrState::ProvisionedNotPubliclyAdvertisable
      else
        raise Exception.new("unknown enum value for 'ByoipCidrState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ByoipCidrState::Advertised                         then "advertised"
      when AEC::ByoipCidrState::Deprovisioned                      then "deprovisioned"
      when AEC::ByoipCidrState::FailedDeprovision                  then "failed-deprovision"
      when AEC::ByoipCidrState::FailedProvision                    then "failed-provision"
      when AEC::ByoipCidrState::PendingAdvertising                 then "pending-advertising"
      when AEC::ByoipCidrState::PendingDeprovision                 then "pending-deprovision"
      when AEC::ByoipCidrState::PendingProvision                   then "pending-provision"
      when AEC::ByoipCidrState::PendingWithdrawal                  then "pending-withdrawal"
      when AEC::ByoipCidrState::Provisioned                        then "provisioned"
      when AEC::ByoipCidrState::ProvisionedNotPubliclyAdvertisable then "provisioned-not-publicly-advertisable"
      else
        raise Exception.new("unknown enum value for 'ByoipCidrState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ByoipCidrState?
      case key
      when "advertised"                            then AEC::ByoipCidrState::Advertised
      when "deprovisioned"                         then AEC::ByoipCidrState::Deprovisioned
      when "failed-deprovision"                    then AEC::ByoipCidrState::FailedDeprovision
      when "failed-provision"                      then AEC::ByoipCidrState::FailedProvision
      when "pending-advertising"                   then AEC::ByoipCidrState::PendingAdvertising
      when "pending-deprovision"                   then AEC::ByoipCidrState::PendingDeprovision
      when "pending-provision"                     then AEC::ByoipCidrState::PendingProvision
      when "pending-withdrawal"                    then AEC::ByoipCidrState::PendingWithdrawal
      when "provisioned"                           then AEC::ByoipCidrState::Provisioned
      when "provisioned-not-publicly-advertisable" then AEC::ByoipCidrState::ProvisionedNotPubliclyAdvertisable
      else
        nil
      end
    end
  end
end
