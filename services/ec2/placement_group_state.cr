private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PlacementGroupState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : PlacementGroupState, json : JSON::Builder) : Nil
      value = case e
              when AEC::PlacementGroupState::Pending   then "pending"
              when AEC::PlacementGroupState::Available then "available"
              when AEC::PlacementGroupState::Deleting  then "deleting"
              when AEC::PlacementGroupState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'PlacementGroupState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PlacementGroupState
      value = pull.read_string
      case value
      when "pending"   then AEC::PlacementGroupState::Pending
      when "available" then AEC::PlacementGroupState::Available
      when "deleting"  then AEC::PlacementGroupState::Deleting
      when "deleted"   then AEC::PlacementGroupState::Deleted
      else
        raise Exception.new("unknown enum value for 'PlacementGroupState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PlacementGroupState::Pending   then "pending"
      when AEC::PlacementGroupState::Available then "available"
      when AEC::PlacementGroupState::Deleting  then "deleting"
      when AEC::PlacementGroupState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'PlacementGroupState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PlacementGroupState?
      case key
      when "pending"   then AEC::PlacementGroupState::Pending
      when "available" then AEC::PlacementGroupState::Available
      when "deleting"  then AEC::PlacementGroupState::Deleting
      when "deleted"   then AEC::PlacementGroupState::Deleted
      else
        nil
      end
    end
  end
end
