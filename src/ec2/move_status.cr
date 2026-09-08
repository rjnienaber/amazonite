private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MoveStatus
    MovingToVpc
    RestoringToClassic

    def self.to_json(e : MoveStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::MoveStatus::MovingToVpc        then "movingToVpc"
              when AEC::MoveStatus::RestoringToClassic then "restoringToClassic"
              else
                raise Exception.new("unknown enum value for 'MoveStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MoveStatus
      value = pull.read_string
      case value
      when "movingToVpc"        then AEC::MoveStatus::MovingToVpc
      when "restoringToClassic" then AEC::MoveStatus::RestoringToClassic
      else
        raise Exception.new("unknown enum value for 'MoveStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MoveStatus::MovingToVpc        then "movingToVpc"
      when AEC::MoveStatus::RestoringToClassic then "restoringToClassic"
      else
        raise Exception.new("unknown enum value for 'MoveStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MoveStatus?
      case key
      when "movingToVpc"        then AEC::MoveStatus::MovingToVpc
      when "restoringToClassic" then AEC::MoveStatus::RestoringToClassic
      else
        nil
      end
    end
  end
end
