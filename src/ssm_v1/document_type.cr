private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum DocumentType
    Command
    Policy
    Automation
    Session
    Package
    ApplicationConfiguration
    ApplicationConfigurationSchema
    DeploymentStrategy
    ChangeCalendar
    AutomationChangeTemplate
    ProblemAnalysis
    ProblemAnalysisTemplate
    CloudFormation
    ConformancePackTemplate

    def self.to_json(e : DocumentType, json : JSON::Builder) : Nil
      value = case e
              when AS::DocumentType::Command                        then "Command"
              when AS::DocumentType::Policy                         then "Policy"
              when AS::DocumentType::Automation                     then "Automation"
              when AS::DocumentType::Session                        then "Session"
              when AS::DocumentType::Package                        then "Package"
              when AS::DocumentType::ApplicationConfiguration       then "ApplicationConfiguration"
              when AS::DocumentType::ApplicationConfigurationSchema then "ApplicationConfigurationSchema"
              when AS::DocumentType::DeploymentStrategy             then "DeploymentStrategy"
              when AS::DocumentType::ChangeCalendar                 then "ChangeCalendar"
              when AS::DocumentType::AutomationChangeTemplate       then "Automation.ChangeTemplate"
              when AS::DocumentType::ProblemAnalysis                then "ProblemAnalysis"
              when AS::DocumentType::ProblemAnalysisTemplate        then "ProblemAnalysisTemplate"
              when AS::DocumentType::CloudFormation                 then "CloudFormation"
              when AS::DocumentType::ConformancePackTemplate        then "ConformancePackTemplate"
              else
                raise Exception.new("unknown enum value for 'DocumentType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentType
      value = pull.read_string
      case value
      when "Command"                        then AS::DocumentType::Command
      when "Policy"                         then AS::DocumentType::Policy
      when "Automation"                     then AS::DocumentType::Automation
      when "Session"                        then AS::DocumentType::Session
      when "Package"                        then AS::DocumentType::Package
      when "ApplicationConfiguration"       then AS::DocumentType::ApplicationConfiguration
      when "ApplicationConfigurationSchema" then AS::DocumentType::ApplicationConfigurationSchema
      when "DeploymentStrategy"             then AS::DocumentType::DeploymentStrategy
      when "ChangeCalendar"                 then AS::DocumentType::ChangeCalendar
      when "Automation.ChangeTemplate"      then AS::DocumentType::AutomationChangeTemplate
      when "ProblemAnalysis"                then AS::DocumentType::ProblemAnalysis
      when "ProblemAnalysisTemplate"        then AS::DocumentType::ProblemAnalysisTemplate
      when "CloudFormation"                 then AS::DocumentType::CloudFormation
      when "ConformancePackTemplate"        then AS::DocumentType::ConformancePackTemplate
      else
        raise Exception.new("unknown enum value for 'DocumentType' when deserializing from json: '#{value}'")
      end
    end
  end
end
