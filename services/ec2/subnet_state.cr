private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SubnetState
    Pending
    Available
    Unavailable
    Failed
    FailedInsufficientCapacity

    def self.to_json(e : SubnetState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SubnetState::Pending                    then "pending"
              when AEC::SubnetState::Available                  then "available"
              when AEC::SubnetState::Unavailable                then "unavailable"
              when AEC::SubnetState::Failed                     then "failed"
              when AEC::SubnetState::FailedInsufficientCapacity then "failed-insufficient-capacity"
              else
                raise Exception.new("unknown enum value for 'SubnetState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SubnetState
      value = pull.read_string
      case value
      when "pending"                      then AEC::SubnetState::Pending
      when "available"                    then AEC::SubnetState::Available
      when "unavailable"                  then AEC::SubnetState::Unavailable
      when "failed"                       then AEC::SubnetState::Failed
      when "failed-insufficient-capacity" then AEC::SubnetState::FailedInsufficientCapacity
      else
        raise Exception.new("unknown enum value for 'SubnetState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SubnetState::Pending                    then "pending"
      when AEC::SubnetState::Available                  then "available"
      when AEC::SubnetState::Unavailable                then "unavailable"
      when AEC::SubnetState::Failed                     then "failed"
      when AEC::SubnetState::FailedInsufficientCapacity then "failed-insufficient-capacity"
      else
        raise Exception.new("unknown enum value for 'SubnetState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SubnetState?
      case key
      when "pending"                      then AEC::SubnetState::Pending
      when "available"                    then AEC::SubnetState::Available
      when "unavailable"                  then AEC::SubnetState::Unavailable
      when "failed"                       then AEC::SubnetState::Failed
      when "failed-insufficient-capacity" then AEC::SubnetState::FailedInsufficientCapacity
      else
        nil
      end
    end
  end
end
