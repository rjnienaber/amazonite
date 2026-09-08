private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayMeteringPolicyEntryState
    Available
    Deleted

    def self.to_json(e : TransitGatewayMeteringPolicyEntryState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayMeteringPolicyEntryState::Available then "available"
              when AEC::TransitGatewayMeteringPolicyEntryState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayMeteringPolicyEntryState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayMeteringPolicyEntryState
      value = pull.read_string
      case value
      when "available" then AEC::TransitGatewayMeteringPolicyEntryState::Available
      when "deleted"   then AEC::TransitGatewayMeteringPolicyEntryState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMeteringPolicyEntryState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayMeteringPolicyEntryState::Available then "available"
      when AEC::TransitGatewayMeteringPolicyEntryState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMeteringPolicyEntryState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayMeteringPolicyEntryState?
      case key
      when "available" then AEC::TransitGatewayMeteringPolicyEntryState::Available
      when "deleted"   then AEC::TransitGatewayMeteringPolicyEntryState::Deleted
      else
        nil
      end
    end
  end
end
