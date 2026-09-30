private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamResourceDiscoveryAssociationState
    AssociateInProgress
    AssociateComplete
    AssociateFailed
    DisassociateInProgress
    DisassociateComplete
    DisassociateFailed
    IsolateInProgress
    IsolateComplete
    RestoreInProgress

    def self.to_json(e : IpamResourceDiscoveryAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamResourceDiscoveryAssociationState::AssociateInProgress    then "associate-in-progress"
              when AEC::IpamResourceDiscoveryAssociationState::AssociateComplete      then "associate-complete"
              when AEC::IpamResourceDiscoveryAssociationState::AssociateFailed        then "associate-failed"
              when AEC::IpamResourceDiscoveryAssociationState::DisassociateInProgress then "disassociate-in-progress"
              when AEC::IpamResourceDiscoveryAssociationState::DisassociateComplete   then "disassociate-complete"
              when AEC::IpamResourceDiscoveryAssociationState::DisassociateFailed     then "disassociate-failed"
              when AEC::IpamResourceDiscoveryAssociationState::IsolateInProgress      then "isolate-in-progress"
              when AEC::IpamResourceDiscoveryAssociationState::IsolateComplete        then "isolate-complete"
              when AEC::IpamResourceDiscoveryAssociationState::RestoreInProgress      then "restore-in-progress"
              else
                raise Exception.new("unknown enum value for 'IpamResourceDiscoveryAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamResourceDiscoveryAssociationState
      value = pull.read_string
      case value
      when "associate-in-progress"    then AEC::IpamResourceDiscoveryAssociationState::AssociateInProgress
      when "associate-complete"       then AEC::IpamResourceDiscoveryAssociationState::AssociateComplete
      when "associate-failed"         then AEC::IpamResourceDiscoveryAssociationState::AssociateFailed
      when "disassociate-in-progress" then AEC::IpamResourceDiscoveryAssociationState::DisassociateInProgress
      when "disassociate-complete"    then AEC::IpamResourceDiscoveryAssociationState::DisassociateComplete
      when "disassociate-failed"      then AEC::IpamResourceDiscoveryAssociationState::DisassociateFailed
      when "isolate-in-progress"      then AEC::IpamResourceDiscoveryAssociationState::IsolateInProgress
      when "isolate-complete"         then AEC::IpamResourceDiscoveryAssociationState::IsolateComplete
      when "restore-in-progress"      then AEC::IpamResourceDiscoveryAssociationState::RestoreInProgress
      else
        raise Exception.new("unknown enum value for 'IpamResourceDiscoveryAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamResourceDiscoveryAssociationState::AssociateInProgress    then "associate-in-progress"
      when AEC::IpamResourceDiscoveryAssociationState::AssociateComplete      then "associate-complete"
      when AEC::IpamResourceDiscoveryAssociationState::AssociateFailed        then "associate-failed"
      when AEC::IpamResourceDiscoveryAssociationState::DisassociateInProgress then "disassociate-in-progress"
      when AEC::IpamResourceDiscoveryAssociationState::DisassociateComplete   then "disassociate-complete"
      when AEC::IpamResourceDiscoveryAssociationState::DisassociateFailed     then "disassociate-failed"
      when AEC::IpamResourceDiscoveryAssociationState::IsolateInProgress      then "isolate-in-progress"
      when AEC::IpamResourceDiscoveryAssociationState::IsolateComplete        then "isolate-complete"
      when AEC::IpamResourceDiscoveryAssociationState::RestoreInProgress      then "restore-in-progress"
      else
        raise Exception.new("unknown enum value for 'IpamResourceDiscoveryAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamResourceDiscoveryAssociationState?
      case key
      when "associate-in-progress"    then AEC::IpamResourceDiscoveryAssociationState::AssociateInProgress
      when "associate-complete"       then AEC::IpamResourceDiscoveryAssociationState::AssociateComplete
      when "associate-failed"         then AEC::IpamResourceDiscoveryAssociationState::AssociateFailed
      when "disassociate-in-progress" then AEC::IpamResourceDiscoveryAssociationState::DisassociateInProgress
      when "disassociate-complete"    then AEC::IpamResourceDiscoveryAssociationState::DisassociateComplete
      when "disassociate-failed"      then AEC::IpamResourceDiscoveryAssociationState::DisassociateFailed
      when "isolate-in-progress"      then AEC::IpamResourceDiscoveryAssociationState::IsolateInProgress
      when "isolate-complete"         then AEC::IpamResourceDiscoveryAssociationState::IsolateComplete
      when "restore-in-progress"      then AEC::IpamResourceDiscoveryAssociationState::RestoreInProgress
      else
        nil
      end
    end
  end
end
