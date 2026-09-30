private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum PlacementConstraintType
    DistinctInstance
    MemberOf

    def self.to_json(e : PlacementConstraintType, json : JSON::Builder) : Nil
      value = case e
              when AEB::PlacementConstraintType::DistinctInstance then "distinctInstance"
              when AEB::PlacementConstraintType::MemberOf         then "memberOf"
              else
                raise Exception.new("unknown enum value for 'PlacementConstraintType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::PlacementConstraintType
      value = pull.read_string
      case value
      when "distinctInstance" then AEB::PlacementConstraintType::DistinctInstance
      when "memberOf"         then AEB::PlacementConstraintType::MemberOf
      else
        raise Exception.new("unknown enum value for 'PlacementConstraintType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::PlacementConstraintType::DistinctInstance then "distinctInstance"
      when AEB::PlacementConstraintType::MemberOf         then "memberOf"
      else
        raise Exception.new("unknown enum value for 'PlacementConstraintType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::PlacementConstraintType?
      case key
      when "distinctInstance" then AEB::PlacementConstraintType::DistinctInstance
      when "memberOf"         then AEB::PlacementConstraintType::MemberOf
      else
        nil
      end
    end
  end
end
