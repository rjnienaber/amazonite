private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ResourceTypeForTagging
    Document
    ManagedInstance
    MaintenanceWindow
    Parameter
    PatchBaseline
    OpsItem
    OpsMetadata
    Automation
    Association

    def self.to_json(e : ResourceTypeForTagging, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ResourceTypeForTagging
      value = pull.read_string
      case value
      when "Document"          then AS::ResourceTypeForTagging::Document
      when "ManagedInstance"   then AS::ResourceTypeForTagging::ManagedInstance
      when "MaintenanceWindow" then AS::ResourceTypeForTagging::MaintenanceWindow
      when "Parameter"         then AS::ResourceTypeForTagging::Parameter
      when "PatchBaseline"     then AS::ResourceTypeForTagging::PatchBaseline
      when "OpsItem"           then AS::ResourceTypeForTagging::OpsItem
      when "OpsMetadata"       then AS::ResourceTypeForTagging::OpsMetadata
      when "Automation"        then AS::ResourceTypeForTagging::Automation
      when "Association"       then AS::ResourceTypeForTagging::Association
      else
        raise Exception.new("unknown enum value for 'ResourceTypeForTagging' when deserializing from json: '#{value}'")
      end
    end
  end
end
