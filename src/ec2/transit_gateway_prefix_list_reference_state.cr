private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayPrefixListReferenceState
    Pending
    Available
    Modifying
    Deleting

    def self.to_json(e : TransitGatewayPrefixListReferenceState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayPrefixListReferenceState::Pending   then "pending"
              when AEC::TransitGatewayPrefixListReferenceState::Available then "available"
              when AEC::TransitGatewayPrefixListReferenceState::Modifying then "modifying"
              when AEC::TransitGatewayPrefixListReferenceState::Deleting  then "deleting"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayPrefixListReferenceState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayPrefixListReferenceState
      value = pull.read_string
      case value
      when "pending"   then AEC::TransitGatewayPrefixListReferenceState::Pending
      when "available" then AEC::TransitGatewayPrefixListReferenceState::Available
      when "modifying" then AEC::TransitGatewayPrefixListReferenceState::Modifying
      when "deleting"  then AEC::TransitGatewayPrefixListReferenceState::Deleting
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPrefixListReferenceState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayPrefixListReferenceState::Pending   then "pending"
      when AEC::TransitGatewayPrefixListReferenceState::Available then "available"
      when AEC::TransitGatewayPrefixListReferenceState::Modifying then "modifying"
      when AEC::TransitGatewayPrefixListReferenceState::Deleting  then "deleting"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayPrefixListReferenceState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayPrefixListReferenceState?
      case key
      when "pending"   then AEC::TransitGatewayPrefixListReferenceState::Pending
      when "available" then AEC::TransitGatewayPrefixListReferenceState::Available
      when "modifying" then AEC::TransitGatewayPrefixListReferenceState::Modifying
      when "deleting"  then AEC::TransitGatewayPrefixListReferenceState::Deleting
      else
        nil
      end
    end
  end
end
