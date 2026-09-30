private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum MaintenanceWindowTaskCutoffBehavior
    ContinueTask
    CancelTask

    def self.to_json(e : MaintenanceWindowTaskCutoffBehavior, json : JSON::Builder) : Nil
      value = case e
              when AS::MaintenanceWindowTaskCutoffBehavior::ContinueTask then "CONTINUE_TASK"
              when AS::MaintenanceWindowTaskCutoffBehavior::CancelTask   then "CANCEL_TASK"
              else
                raise Exception.new("unknown enum value for 'MaintenanceWindowTaskCutoffBehavior' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MaintenanceWindowTaskCutoffBehavior
      value = pull.read_string
      case value
      when "CONTINUE_TASK" then AS::MaintenanceWindowTaskCutoffBehavior::ContinueTask
      when "CANCEL_TASK"   then AS::MaintenanceWindowTaskCutoffBehavior::CancelTask
      else
        raise Exception.new("unknown enum value for 'MaintenanceWindowTaskCutoffBehavior' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::MaintenanceWindowTaskCutoffBehavior::ContinueTask then "CONTINUE_TASK"
      when AS::MaintenanceWindowTaskCutoffBehavior::CancelTask   then "CANCEL_TASK"
      else
        raise Exception.new("unknown enum value for 'MaintenanceWindowTaskCutoffBehavior' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::MaintenanceWindowTaskCutoffBehavior?
      case key
      when "CONTINUE_TASK" then AS::MaintenanceWindowTaskCutoffBehavior::ContinueTask
      when "CANCEL_TASK"   then AS::MaintenanceWindowTaskCutoffBehavior::CancelTask
      else
        nil
      end
    end
  end
end
