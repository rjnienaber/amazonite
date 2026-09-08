private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The state of a BYOIP CIDR.
  enum IpamByoipCidrState
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

    def self.to_json(e : IpamByoipCidrState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamByoipCidrState::Advertised                         then "advertised"
              when AEC::IpamByoipCidrState::Deprovisioned                      then "deprovisioned"
              when AEC::IpamByoipCidrState::FailedDeprovision                  then "failed-deprovision"
              when AEC::IpamByoipCidrState::FailedProvision                    then "failed-provision"
              when AEC::IpamByoipCidrState::PendingAdvertising                 then "pending-advertising"
              when AEC::IpamByoipCidrState::PendingDeprovision                 then "pending-deprovision"
              when AEC::IpamByoipCidrState::PendingProvision                   then "pending-provision"
              when AEC::IpamByoipCidrState::PendingWithdrawal                  then "pending-withdrawal"
              when AEC::IpamByoipCidrState::Provisioned                        then "provisioned"
              when AEC::IpamByoipCidrState::ProvisionedNotPubliclyAdvertisable then "provisioned-not-publicly-advertisable"
              else
                raise Exception.new("unknown enum value for 'IpamByoipCidrState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamByoipCidrState
      value = pull.read_string
      case value
      when "advertised"                            then AEC::IpamByoipCidrState::Advertised
      when "deprovisioned"                         then AEC::IpamByoipCidrState::Deprovisioned
      when "failed-deprovision"                    then AEC::IpamByoipCidrState::FailedDeprovision
      when "failed-provision"                      then AEC::IpamByoipCidrState::FailedProvision
      when "pending-advertising"                   then AEC::IpamByoipCidrState::PendingAdvertising
      when "pending-deprovision"                   then AEC::IpamByoipCidrState::PendingDeprovision
      when "pending-provision"                     then AEC::IpamByoipCidrState::PendingProvision
      when "pending-withdrawal"                    then AEC::IpamByoipCidrState::PendingWithdrawal
      when "provisioned"                           then AEC::IpamByoipCidrState::Provisioned
      when "provisioned-not-publicly-advertisable" then AEC::IpamByoipCidrState::ProvisionedNotPubliclyAdvertisable
      else
        raise Exception.new("unknown enum value for 'IpamByoipCidrState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamByoipCidrState::Advertised                         then "advertised"
      when AEC::IpamByoipCidrState::Deprovisioned                      then "deprovisioned"
      when AEC::IpamByoipCidrState::FailedDeprovision                  then "failed-deprovision"
      when AEC::IpamByoipCidrState::FailedProvision                    then "failed-provision"
      when AEC::IpamByoipCidrState::PendingAdvertising                 then "pending-advertising"
      when AEC::IpamByoipCidrState::PendingDeprovision                 then "pending-deprovision"
      when AEC::IpamByoipCidrState::PendingProvision                   then "pending-provision"
      when AEC::IpamByoipCidrState::PendingWithdrawal                  then "pending-withdrawal"
      when AEC::IpamByoipCidrState::Provisioned                        then "provisioned"
      when AEC::IpamByoipCidrState::ProvisionedNotPubliclyAdvertisable then "provisioned-not-publicly-advertisable"
      else
        raise Exception.new("unknown enum value for 'IpamByoipCidrState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamByoipCidrState?
      case key
      when "advertised"                            then AEC::IpamByoipCidrState::Advertised
      when "deprovisioned"                         then AEC::IpamByoipCidrState::Deprovisioned
      when "failed-deprovision"                    then AEC::IpamByoipCidrState::FailedDeprovision
      when "failed-provision"                      then AEC::IpamByoipCidrState::FailedProvision
      when "pending-advertising"                   then AEC::IpamByoipCidrState::PendingAdvertising
      when "pending-deprovision"                   then AEC::IpamByoipCidrState::PendingDeprovision
      when "pending-provision"                     then AEC::IpamByoipCidrState::PendingProvision
      when "pending-withdrawal"                    then AEC::IpamByoipCidrState::PendingWithdrawal
      when "provisioned"                           then AEC::IpamByoipCidrState::Provisioned
      when "provisioned-not-publicly-advertisable" then AEC::IpamByoipCidrState::ProvisionedNotPubliclyAdvertisable
      else
        nil
      end
    end
  end
end
