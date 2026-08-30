private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ResourceStatus
    CreateInProgress
    CreateFailed
    CreateComplete
    DeleteInProgress
    DeleteFailed
    DeleteComplete
    DeleteSkipped
    UpdateInProgress
    UpdateFailed
    UpdateComplete
    ImportFailed
    ImportComplete
    ImportInProgress
    ImportRollbackInProgress
    ImportRollbackFailed
    ImportRollbackComplete
    ExportFailed
    ExportComplete
    ExportInProgress
    ExportRollbackInProgress
    ExportRollbackFailed
    ExportRollbackComplete
    UpdateRollbackInProgress
    UpdateRollbackComplete
    UpdateRollbackFailed
    RollbackInProgress
    RollbackComplete
    RollbackFailed

    def self.to_json(e : ResourceStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::ResourceStatus::CreateInProgress         then "CREATE_IN_PROGRESS"
              when ACF::ResourceStatus::CreateFailed             then "CREATE_FAILED"
              when ACF::ResourceStatus::CreateComplete           then "CREATE_COMPLETE"
              when ACF::ResourceStatus::DeleteInProgress         then "DELETE_IN_PROGRESS"
              when ACF::ResourceStatus::DeleteFailed             then "DELETE_FAILED"
              when ACF::ResourceStatus::DeleteComplete           then "DELETE_COMPLETE"
              when ACF::ResourceStatus::DeleteSkipped            then "DELETE_SKIPPED"
              when ACF::ResourceStatus::UpdateInProgress         then "UPDATE_IN_PROGRESS"
              when ACF::ResourceStatus::UpdateFailed             then "UPDATE_FAILED"
              when ACF::ResourceStatus::UpdateComplete           then "UPDATE_COMPLETE"
              when ACF::ResourceStatus::ImportFailed             then "IMPORT_FAILED"
              when ACF::ResourceStatus::ImportComplete           then "IMPORT_COMPLETE"
              when ACF::ResourceStatus::ImportInProgress         then "IMPORT_IN_PROGRESS"
              when ACF::ResourceStatus::ImportRollbackInProgress then "IMPORT_ROLLBACK_IN_PROGRESS"
              when ACF::ResourceStatus::ImportRollbackFailed     then "IMPORT_ROLLBACK_FAILED"
              when ACF::ResourceStatus::ImportRollbackComplete   then "IMPORT_ROLLBACK_COMPLETE"
              when ACF::ResourceStatus::ExportFailed             then "EXPORT_FAILED"
              when ACF::ResourceStatus::ExportComplete           then "EXPORT_COMPLETE"
              when ACF::ResourceStatus::ExportInProgress         then "EXPORT_IN_PROGRESS"
              when ACF::ResourceStatus::ExportRollbackInProgress then "EXPORT_ROLLBACK_IN_PROGRESS"
              when ACF::ResourceStatus::ExportRollbackFailed     then "EXPORT_ROLLBACK_FAILED"
              when ACF::ResourceStatus::ExportRollbackComplete   then "EXPORT_ROLLBACK_COMPLETE"
              when ACF::ResourceStatus::UpdateRollbackInProgress then "UPDATE_ROLLBACK_IN_PROGRESS"
              when ACF::ResourceStatus::UpdateRollbackComplete   then "UPDATE_ROLLBACK_COMPLETE"
              when ACF::ResourceStatus::UpdateRollbackFailed     then "UPDATE_ROLLBACK_FAILED"
              when ACF::ResourceStatus::RollbackInProgress       then "ROLLBACK_IN_PROGRESS"
              when ACF::ResourceStatus::RollbackComplete         then "ROLLBACK_COMPLETE"
              when ACF::ResourceStatus::RollbackFailed           then "ROLLBACK_FAILED"
              else
                raise Exception.new("unknown enum value for 'ResourceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ResourceStatus
      value = pull.read_string
      case value
      when "CREATE_IN_PROGRESS"          then ACF::ResourceStatus::CreateInProgress
      when "CREATE_FAILED"               then ACF::ResourceStatus::CreateFailed
      when "CREATE_COMPLETE"             then ACF::ResourceStatus::CreateComplete
      when "DELETE_IN_PROGRESS"          then ACF::ResourceStatus::DeleteInProgress
      when "DELETE_FAILED"               then ACF::ResourceStatus::DeleteFailed
      when "DELETE_COMPLETE"             then ACF::ResourceStatus::DeleteComplete
      when "DELETE_SKIPPED"              then ACF::ResourceStatus::DeleteSkipped
      when "UPDATE_IN_PROGRESS"          then ACF::ResourceStatus::UpdateInProgress
      when "UPDATE_FAILED"               then ACF::ResourceStatus::UpdateFailed
      when "UPDATE_COMPLETE"             then ACF::ResourceStatus::UpdateComplete
      when "IMPORT_FAILED"               then ACF::ResourceStatus::ImportFailed
      when "IMPORT_COMPLETE"             then ACF::ResourceStatus::ImportComplete
      when "IMPORT_IN_PROGRESS"          then ACF::ResourceStatus::ImportInProgress
      when "IMPORT_ROLLBACK_IN_PROGRESS" then ACF::ResourceStatus::ImportRollbackInProgress
      when "IMPORT_ROLLBACK_FAILED"      then ACF::ResourceStatus::ImportRollbackFailed
      when "IMPORT_ROLLBACK_COMPLETE"    then ACF::ResourceStatus::ImportRollbackComplete
      when "EXPORT_FAILED"               then ACF::ResourceStatus::ExportFailed
      when "EXPORT_COMPLETE"             then ACF::ResourceStatus::ExportComplete
      when "EXPORT_IN_PROGRESS"          then ACF::ResourceStatus::ExportInProgress
      when "EXPORT_ROLLBACK_IN_PROGRESS" then ACF::ResourceStatus::ExportRollbackInProgress
      when "EXPORT_ROLLBACK_FAILED"      then ACF::ResourceStatus::ExportRollbackFailed
      when "EXPORT_ROLLBACK_COMPLETE"    then ACF::ResourceStatus::ExportRollbackComplete
      when "UPDATE_ROLLBACK_IN_PROGRESS" then ACF::ResourceStatus::UpdateRollbackInProgress
      when "UPDATE_ROLLBACK_COMPLETE"    then ACF::ResourceStatus::UpdateRollbackComplete
      when "UPDATE_ROLLBACK_FAILED"      then ACF::ResourceStatus::UpdateRollbackFailed
      when "ROLLBACK_IN_PROGRESS"        then ACF::ResourceStatus::RollbackInProgress
      when "ROLLBACK_COMPLETE"           then ACF::ResourceStatus::RollbackComplete
      when "ROLLBACK_FAILED"             then ACF::ResourceStatus::RollbackFailed
      else
        raise Exception.new("unknown enum value for 'ResourceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ResourceStatus::CreateInProgress         then "CREATE_IN_PROGRESS"
      when ACF::ResourceStatus::CreateFailed             then "CREATE_FAILED"
      when ACF::ResourceStatus::CreateComplete           then "CREATE_COMPLETE"
      when ACF::ResourceStatus::DeleteInProgress         then "DELETE_IN_PROGRESS"
      when ACF::ResourceStatus::DeleteFailed             then "DELETE_FAILED"
      when ACF::ResourceStatus::DeleteComplete           then "DELETE_COMPLETE"
      when ACF::ResourceStatus::DeleteSkipped            then "DELETE_SKIPPED"
      when ACF::ResourceStatus::UpdateInProgress         then "UPDATE_IN_PROGRESS"
      when ACF::ResourceStatus::UpdateFailed             then "UPDATE_FAILED"
      when ACF::ResourceStatus::UpdateComplete           then "UPDATE_COMPLETE"
      when ACF::ResourceStatus::ImportFailed             then "IMPORT_FAILED"
      when ACF::ResourceStatus::ImportComplete           then "IMPORT_COMPLETE"
      when ACF::ResourceStatus::ImportInProgress         then "IMPORT_IN_PROGRESS"
      when ACF::ResourceStatus::ImportRollbackInProgress then "IMPORT_ROLLBACK_IN_PROGRESS"
      when ACF::ResourceStatus::ImportRollbackFailed     then "IMPORT_ROLLBACK_FAILED"
      when ACF::ResourceStatus::ImportRollbackComplete   then "IMPORT_ROLLBACK_COMPLETE"
      when ACF::ResourceStatus::ExportFailed             then "EXPORT_FAILED"
      when ACF::ResourceStatus::ExportComplete           then "EXPORT_COMPLETE"
      when ACF::ResourceStatus::ExportInProgress         then "EXPORT_IN_PROGRESS"
      when ACF::ResourceStatus::ExportRollbackInProgress then "EXPORT_ROLLBACK_IN_PROGRESS"
      when ACF::ResourceStatus::ExportRollbackFailed     then "EXPORT_ROLLBACK_FAILED"
      when ACF::ResourceStatus::ExportRollbackComplete   then "EXPORT_ROLLBACK_COMPLETE"
      when ACF::ResourceStatus::UpdateRollbackInProgress then "UPDATE_ROLLBACK_IN_PROGRESS"
      when ACF::ResourceStatus::UpdateRollbackComplete   then "UPDATE_ROLLBACK_COMPLETE"
      when ACF::ResourceStatus::UpdateRollbackFailed     then "UPDATE_ROLLBACK_FAILED"
      when ACF::ResourceStatus::RollbackInProgress       then "ROLLBACK_IN_PROGRESS"
      when ACF::ResourceStatus::RollbackComplete         then "ROLLBACK_COMPLETE"
      when ACF::ResourceStatus::RollbackFailed           then "ROLLBACK_FAILED"
      else
        raise Exception.new("unknown enum value for 'ResourceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ResourceStatus?
      case key
      when "CREATE_IN_PROGRESS"          then ACF::ResourceStatus::CreateInProgress
      when "CREATE_FAILED"               then ACF::ResourceStatus::CreateFailed
      when "CREATE_COMPLETE"             then ACF::ResourceStatus::CreateComplete
      when "DELETE_IN_PROGRESS"          then ACF::ResourceStatus::DeleteInProgress
      when "DELETE_FAILED"               then ACF::ResourceStatus::DeleteFailed
      when "DELETE_COMPLETE"             then ACF::ResourceStatus::DeleteComplete
      when "DELETE_SKIPPED"              then ACF::ResourceStatus::DeleteSkipped
      when "UPDATE_IN_PROGRESS"          then ACF::ResourceStatus::UpdateInProgress
      when "UPDATE_FAILED"               then ACF::ResourceStatus::UpdateFailed
      when "UPDATE_COMPLETE"             then ACF::ResourceStatus::UpdateComplete
      when "IMPORT_FAILED"               then ACF::ResourceStatus::ImportFailed
      when "IMPORT_COMPLETE"             then ACF::ResourceStatus::ImportComplete
      when "IMPORT_IN_PROGRESS"          then ACF::ResourceStatus::ImportInProgress
      when "IMPORT_ROLLBACK_IN_PROGRESS" then ACF::ResourceStatus::ImportRollbackInProgress
      when "IMPORT_ROLLBACK_FAILED"      then ACF::ResourceStatus::ImportRollbackFailed
      when "IMPORT_ROLLBACK_COMPLETE"    then ACF::ResourceStatus::ImportRollbackComplete
      when "EXPORT_FAILED"               then ACF::ResourceStatus::ExportFailed
      when "EXPORT_COMPLETE"             then ACF::ResourceStatus::ExportComplete
      when "EXPORT_IN_PROGRESS"          then ACF::ResourceStatus::ExportInProgress
      when "EXPORT_ROLLBACK_IN_PROGRESS" then ACF::ResourceStatus::ExportRollbackInProgress
      when "EXPORT_ROLLBACK_FAILED"      then ACF::ResourceStatus::ExportRollbackFailed
      when "EXPORT_ROLLBACK_COMPLETE"    then ACF::ResourceStatus::ExportRollbackComplete
      when "UPDATE_ROLLBACK_IN_PROGRESS" then ACF::ResourceStatus::UpdateRollbackInProgress
      when "UPDATE_ROLLBACK_COMPLETE"    then ACF::ResourceStatus::UpdateRollbackComplete
      when "UPDATE_ROLLBACK_FAILED"      then ACF::ResourceStatus::UpdateRollbackFailed
      when "ROLLBACK_IN_PROGRESS"        then ACF::ResourceStatus::RollbackInProgress
      when "ROLLBACK_COMPLETE"           then ACF::ResourceStatus::RollbackComplete
      when "ROLLBACK_FAILED"             then ACF::ResourceStatus::RollbackFailed
      else
        nil
      end
    end
  end
end
