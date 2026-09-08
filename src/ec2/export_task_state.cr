private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ExportTaskState
    Active
    Cancelling
    Cancelled
    Completed

    def self.to_json(e : ExportTaskState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ExportTaskState::Active     then "active"
              when AEC::ExportTaskState::Cancelling then "cancelling"
              when AEC::ExportTaskState::Cancelled  then "cancelled"
              when AEC::ExportTaskState::Completed  then "completed"
              else
                raise Exception.new("unknown enum value for 'ExportTaskState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ExportTaskState
      value = pull.read_string
      case value
      when "active"     then AEC::ExportTaskState::Active
      when "cancelling" then AEC::ExportTaskState::Cancelling
      when "cancelled"  then AEC::ExportTaskState::Cancelled
      when "completed"  then AEC::ExportTaskState::Completed
      else
        raise Exception.new("unknown enum value for 'ExportTaskState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ExportTaskState::Active     then "active"
      when AEC::ExportTaskState::Cancelling then "cancelling"
      when AEC::ExportTaskState::Cancelled  then "cancelled"
      when AEC::ExportTaskState::Completed  then "completed"
      else
        raise Exception.new("unknown enum value for 'ExportTaskState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ExportTaskState?
      case key
      when "active"     then AEC::ExportTaskState::Active
      when "cancelling" then AEC::ExportTaskState::Cancelling
      when "cancelled"  then AEC::ExportTaskState::Cancelled
      when "completed"  then AEC::ExportTaskState::Completed
      else
        nil
      end
    end
  end
end
