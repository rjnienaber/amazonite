private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NatGatewayAddressStatus
    Assigning
    Unassigning
    Associating
    Disassociating
    Succeeded
    Failed

    def self.to_json(e : NatGatewayAddressStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::NatGatewayAddressStatus::Assigning      then "assigning"
              when AEC::NatGatewayAddressStatus::Unassigning    then "unassigning"
              when AEC::NatGatewayAddressStatus::Associating    then "associating"
              when AEC::NatGatewayAddressStatus::Disassociating then "disassociating"
              when AEC::NatGatewayAddressStatus::Succeeded      then "succeeded"
              when AEC::NatGatewayAddressStatus::Failed         then "failed"
              else
                raise Exception.new("unknown enum value for 'NatGatewayAddressStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NatGatewayAddressStatus
      value = pull.read_string
      case value
      when "assigning"      then AEC::NatGatewayAddressStatus::Assigning
      when "unassigning"    then AEC::NatGatewayAddressStatus::Unassigning
      when "associating"    then AEC::NatGatewayAddressStatus::Associating
      when "disassociating" then AEC::NatGatewayAddressStatus::Disassociating
      when "succeeded"      then AEC::NatGatewayAddressStatus::Succeeded
      when "failed"         then AEC::NatGatewayAddressStatus::Failed
      else
        raise Exception.new("unknown enum value for 'NatGatewayAddressStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NatGatewayAddressStatus::Assigning      then "assigning"
      when AEC::NatGatewayAddressStatus::Unassigning    then "unassigning"
      when AEC::NatGatewayAddressStatus::Associating    then "associating"
      when AEC::NatGatewayAddressStatus::Disassociating then "disassociating"
      when AEC::NatGatewayAddressStatus::Succeeded      then "succeeded"
      when AEC::NatGatewayAddressStatus::Failed         then "failed"
      else
        raise Exception.new("unknown enum value for 'NatGatewayAddressStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NatGatewayAddressStatus?
      case key
      when "assigning"      then AEC::NatGatewayAddressStatus::Assigning
      when "unassigning"    then AEC::NatGatewayAddressStatus::Unassigning
      when "associating"    then AEC::NatGatewayAddressStatus::Associating
      when "disassociating" then AEC::NatGatewayAddressStatus::Disassociating
      when "succeeded"      then AEC::NatGatewayAddressStatus::Succeeded
      when "failed"         then AEC::NatGatewayAddressStatus::Failed
      else
        nil
      end
    end
  end
end
