private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum MaintenanceWindowTaskType
    RunCommand
    Automation
    StepFunctions
    Lambda

    def self.to_json(e : MaintenanceWindowTaskType, json : JSON::Builder) : Nil
      value = case e
              when AS::MaintenanceWindowTaskType::RunCommand    then "RUN_COMMAND"
              when AS::MaintenanceWindowTaskType::Automation    then "AUTOMATION"
              when AS::MaintenanceWindowTaskType::StepFunctions then "STEP_FUNCTIONS"
              when AS::MaintenanceWindowTaskType::Lambda        then "LAMBDA"
              else
                raise Exception.new("unknown enum value for 'MaintenanceWindowTaskType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MaintenanceWindowTaskType
      value = pull.read_string
      case value
      when "RUN_COMMAND"    then AS::MaintenanceWindowTaskType::RunCommand
      when "AUTOMATION"     then AS::MaintenanceWindowTaskType::Automation
      when "STEP_FUNCTIONS" then AS::MaintenanceWindowTaskType::StepFunctions
      when "LAMBDA"         then AS::MaintenanceWindowTaskType::Lambda
      else
        raise Exception.new("unknown enum value for 'MaintenanceWindowTaskType' when deserializing from json: '#{value}'")
      end
    end
  end
end
