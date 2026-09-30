private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ConversionTaskState
    Active
    Cancelling
    Cancelled
    Completed

    def self.to_json(e : ConversionTaskState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ConversionTaskState::Active     then "active"
              when AEC::ConversionTaskState::Cancelling then "cancelling"
              when AEC::ConversionTaskState::Cancelled  then "cancelled"
              when AEC::ConversionTaskState::Completed  then "completed"
              else
                raise Exception.new("unknown enum value for 'ConversionTaskState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ConversionTaskState
      value = pull.read_string
      case value
      when "active"     then AEC::ConversionTaskState::Active
      when "cancelling" then AEC::ConversionTaskState::Cancelling
      when "cancelled"  then AEC::ConversionTaskState::Cancelled
      when "completed"  then AEC::ConversionTaskState::Completed
      else
        raise Exception.new("unknown enum value for 'ConversionTaskState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ConversionTaskState::Active     then "active"
      when AEC::ConversionTaskState::Cancelling then "cancelling"
      when AEC::ConversionTaskState::Cancelled  then "cancelled"
      when AEC::ConversionTaskState::Completed  then "completed"
      else
        raise Exception.new("unknown enum value for 'ConversionTaskState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ConversionTaskState?
      case key
      when "active"     then AEC::ConversionTaskState::Active
      when "cancelling" then AEC::ConversionTaskState::Cancelling
      when "cancelled"  then AEC::ConversionTaskState::Cancelled
      when "completed"  then AEC::ConversionTaskState::Completed
      else
        nil
      end
    end
  end
end
